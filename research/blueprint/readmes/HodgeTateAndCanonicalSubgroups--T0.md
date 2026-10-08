# Hodge–Tate theory, canonical subgroups, and automorphic period maps: T0–T5

Independent review of revision 2, issue #7298, Codex session codex-e11AD3, 8 October 2026. The review accepts this complete target-level planning pass with its explicit gaps. This reader is synchronized with the packet and suggested signatures; no implementation or proof is claimed. The preceding review is retained in the packet history.

The planning pass is complete at 66 nodes: 11 definitions, 13 constructions, 26 theorems, 13 lemmas and 3 comparisons. The definitions/constructions have 136 API items and 83 mathematical tests; 26 nodes are planets. All six stages are **planned**, with 13 recorded gaps and 18 supplier requests. Planned means that each target has a statement and a prerequisite route ending in a pinned declaration, another owner or an explicit gap. It does not mean that a supplier has implemented its output or that a target is proved. Every implementation status remains unchecked. T6 is the separate logarithmic/general-local-system part and is outside this job.

## Starting point and ownership

The upstream ReductiveGroups roadmap supplies the existing algebraic-group direction, its tangent/cocharacter APIs and its parabolic/Levi programme; the pinned point-subgroup declarations alone do not represent a flag variety. General strict filtered Tannakian reconstruction extends that direction as a proposed Part II. T2 keeps the rational Hodge–Tate application. The upstream AdicSpaces roadmap supplies the Huber-pair and adic-space foundations. AdicSpaces Part II R2 is asked for the exact normal formal-model, integral generic-fibre and strict-transform contracts used here. Neither foundational roadmap is re-planned.

- Hodge-type π_HT on the open limit v-sheaf, its equivariance, Levi/bundle pullback, elliptic quotient-line and unsplit Hilbert formulas: **`HodgeTateAndCanonicalSubgroups:T2`**; S3 imports this map for its perfectoid incarnation and compactified extension. The verifier’s /22 qualification prevents the cycle through T4 and S1–S3.
- Hasse invariant Ha(G) = det V* of a BT₁ over any 𝔽_p-scheme, Fargues's isomorphism LF and the BT₁ Hodge–Tate exact sequence, and normalized multiplicative determinant pullback (PIL20 Lemma 6.3.4.1): **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`**; formerly `HodgeTateAndCanonicalSubgroups:T0`.
- Co-Lie complex, finite-flat syntomic determinant/trace duality and commutative-group square-zero deformation: **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`**.
- General finitely presented module/sheaf Fitting operations: **`tauceti:TauCetiRoadmap/StableReduction#layer-0-relative-curves-and-extensions-of-dvrs`**.
- General strict filtered tensor fiber functors, fpqc splitting and reductive stabilizer: **`ReductiveGroups, Part II (proposed extension)`**; formerly `HodgeTateAndCanonicalSubgroups:T2`.

Further supplier boundaries are substantive: R07.1 owns the p-divisible object, Cartier dual, Tate module and the requested O_C conormal/Faltings extension; R07.6 owns the finite-flat group specialization of DD.0 deformation theory and trace duality. C4 supplies the polarized boundary one-motive, while R11.3 must extend its complete-DVR Raynaud output to the actual C-valued setting. P8 supplies relative comparison and its character/Kummer compatibility, P9 integral effective descent, B0/B1 the rational flag/tensor and Tate-normalized Levi interfaces, and O5/O6 coefficient sheaves and Hecke operators. Full requests are listed after the nodes.

## Conventions and quantitative contracts

For H finite locally free over S, ω_H is the pullback of relative differentials along the unit. Affinely it is the existing augmentation cotangent space. The finite character map sends a point of H to a character of H^D and then to the class of its group-like element minus one. For an abelian family the quotient convention is T_pA^∨⊗Ô→ω_A with kernel Lie(A^∨)(1). A kernel line and its quotient point describe the same projective point in dimension one, but their tautological bundles have different twists.

The Fargues ideal δ_G is Fitt₀ω_G. The trace codifferent is its inverse fractional line after restriction to the unit; it is not the torsion module ω_G. Degrees use a normalized real rank-one valuation v(p)=1, with finitely presented valuation-ring modules; module length over a nondiscrete valuation ring is a different invariant. Effective Cartier-divisor pullback requires the determinant to remain regular. Codimension-one checking is confined to integral normal noetherian schemes.

For a multiplicative p-divisible group with character lattice T, ω_G=T⊗ω_μ and its determinant uses det T. R07.2 owns the general normalized pullback; T0 applies it on C4 boundary charts. Factor the determinant as p^r times a unit, without asserting that the full lattice map is p times an automorphism. Normalize the character determinant over ℤ_p before tensoring with the base; this still defines the normalized map when p is nilpotent in the base. Boundary torsion uses a quasi-finite group with a separate finite Raynaud part of height 2g−r and the full polarized one-motive [Y→G̃]; an arbitrary semi-abelian scheme has no asserted dual semi-abelian scheme.

The split finite multiplicative isomorphism uses the constant character fibre (ℤ/p^n)^r⊗R′, or the locally constant character sheaf tensored with 𝒪. Global sections over a disconnected R′ give a different source; over 𝔽_p×𝔽_p they double its rank.

The relative comparison distinguishes B_dR⁺ from the structural O B_dR⁺ sheaf. CS17’s two horizontal lattices M and M₀ produce the graded filtration; gr⁰B_dR=Ô is not an identity for gr⁰O B_dR. The families here descend to the discretely valued K/comparison setting, then may be base extended to C. For an individual abelian variety over arbitrary C the rational sequence instead uses CDM12 Theorem 3.20/Remark 3.21, with A4’s degree-one identifications and Weil duality; finite-Q_p descent is unnecessary. Rational homology tensors give rational G(ℚ_p) frames; integral frames need a separately specified lattice/model. The canonical raw Levi comparison is contracted with the Tate-basis torsor through central μ. A chosen basis gives an underlying untwisted comparison with its transported linearization; it does not erase the μ-weight twist (E31).

Put S_n=(p^n−1)/(p−1) and w=Hasse height. The weak formal condition is S_n w<1/2; the strong sufficient condition is p^n w<1/2. HALO’s w≤p^{−(n+1)} works for every prime: at p=2 its weak inequality remains strict, although the strong inequality may be equality. FAR11’s HN range is strict: w<1/(2p^{n−1}) for p≥5 and w<1/3^n for p=3. The larger BHW geometric-position range w≤1/(c_p p^{n−1}), c_p=2,3,4, is a separate contract with a remaining p≥3 endpoint input.

The HN induction uses a supplied Frobenius-congruent subgroup and the noncircular pointwise quotient-Hasse lemma. At level n it applies induction to p^{−(n−1)}D/D. The later family quotient-radius theorem is downstream.

The canonical conormal comparison is truncated at n−δ, δ=S_n w. The raw dual character map has cokernel degree w/(p−1); it is not an integral isomorphism at positive height. Subtracting this second error gives scalar kernel precision x=n−p^n w/(p−1). This is an O_C-module congruence. The unsplit O_F/p^n canonical generator is a distinct H2/H4 input, and O_F stability plus an underlying rank count does not prove it.

Hilbert data use O_p=O_F⊗ℤ_p, dual-abelian level structures and kernel coordinate z=−HT(e₂)/HT(e₁). The fixed left action gives z↦(az+b)/(cz+d) and j=cz+d. All formulas are on their invertible-denominator domains. Integral error balls use the integral closure of O_p⊗O_C in O_p⊗C, including ramified primes. Generic embedding projections do not identify the tensor order with an integral product. The finite standard Plücker chart indices are all g-subsets of 2g indices, and the full integral symplectic group does not permute those chart domains.

On a normal formal Hilbert chart choose the actual determinant ideal Hdg_T with Hdg_T^{p−1}=Hdg. The integral congruence ideals are I_m=p^m Hdg_T^{−(p^m−1)} and I′_m=p^m Hdg_T^{−p^m}. These are integral ideals on that chart, not formal real powers. AIPH Proposition 4.1 gives the lifted-generator matrix and its adjugate bound; R2 must transfer that calculation to O⁺. Compatible higher-level generators give inclusion of lattices; equal regular determinant ideals make the comparison determinant a unit and prove equality. AIPH Proposition 4.7 compares weight sheaves rather than directly proving this lattice equality.

The AIP structure group is proved from the ratio of two actual AIP lifts over the same abelian base point. The ratio equals cz+d through the open embedding in the total Hodge bundle. The ambient-radius containment has only one direction and is not used backwards. Finite Atkin–Lehner maps use n≥1 and source radius p^nε<1/2; infinite level uses structural forgetful pullback. O5 supplies the associated coefficient sheaves and AIPH Theorem 6.7(3) restriction comparison; O6 separately supplies p-Hecke.

For determinant modifications put D=gb, with b=1/(p−1) at odd p and b=2 conditionally at p=2. Bounds and reductions consistently use p^D and p^{n−D}; for GSp₄/F the conditional p=2 determinant loss is 4[F:ℚ]. The minimal modified determinant pulls back to the toroidal modified determinant even though the whole finite-level Hodge bundle need not descend. The canonical adic section has no unconditional formal-model isomorphism attached.

For weight coefficients choose a common actual AIP coordinate, level, formal-radius and analytic-character domain. The printed all-unit supremum and analytic-radius formula are false (E29–E30); a level-index repair alone does not validate a positive radius. The full finite-character integral generator with unit HT pullback is an explicit O5 gap. The ratio/invariants proof uses that generator and P9 rather than assuming the perfectoid equalizer is already an invertible line. At n=0 both constructions use AL_1.

## Sources read and version limits

All mathematical statements, proof routes and source-issue assessments here are authored paraphrases. Source locators refer to the pinned public versions below, not to their different published pagination. The independent review re-read the used statements and checked all 21 PDF hashes against the packet receipts. No uncleared book was used.

### FAR10

Laurent Fargues, [La filtration de Harder–Narasimhan des schémas en groupes finis et plats](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf). J. reine angew. Math. 645 (2010), 1–39; author copy HNgp.pdf (29 pp.), whose page numbers differ from Crelle's. Read 2026-10-08. SHA-256 `67b58427c00ea67b20bd8e9f7fcd0d90b50b4f0965e90cd95ad2324265c7637a`.

**Sections used.**

- §§1–4 (codifferent, δ_G, degree, slopes, Harder–Narasimhan filtration)
- §6 (monogenic groups)
- §9 (Hodge–Tate triples, Théorèmes 6–7)

### FAR11

Laurent Fargues, [La filtration canonique des points de torsion des groupes p-divisibles (avec la collaboration de Yichao Tian)](https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf). Ann. Sci. ÉNS 44 (2011), 905–961; author copy canoniqueHN.pdf dated 20 October 2011 (46 pp.). Read 2026-10-08. SHA-256 `2424f3b23fa138b44dbf98cbad50db8be4944c6640514084fc0fb26e2a65ccd4`.

**Sections used.**

- §2 (α_G, Hasse invariant, Proposition 2)
- §5 (Théorèmes 1–3)
- §§6–7 (Théorèmes 4–6, Propositions 7–15)
- §§8–9 (families, Théorèmes 7–8)

### SCH15

Peter Scholze, [On torsion in the cohomology of locally symmetric varieties](https://arxiv.org/abs/1306.2070). arXiv:1306.2070v2 (2 June 2015); published Ann. of Math. 182 (2015), 945–1066 (numbering III.x.y = 3.x.y). Read 2026-10-08. SHA-256 `e15abf4e7ab3e400ecaae963e5ccd80b340919d8499ebfde5b55f2ceb83ab285`.

**Sections used.**

- §III.1 (Lemma 3.1.3)
- §III.2 (Theorem 3.2.1 – Lemma 3.2.26)
- §III.3 (Proposition 3.3.1 – Theorem 3.3.18)

### BHW

Christopher Birkbeck, Ben Heuer, Chris Williams, [Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985). arXiv:1902.03985v4 (10 May 2021); published Ann. Inst. Fourier 73 (2023), 1709–1794 (§5/§7 source issues collated with the published version in this review). Read 2026-10-08. SHA-256 `8ee48970dc500f60a6409cca0e6d9feeb693071da00a8b37174776717b708dac`.

**Sections used.**

- §§2–4 (elliptic case)
- §5 (Hilbert set-up, Hasse neighbourhoods, Theorem 5.11, Propositions 5.18–5.19)
- §§6–7 (weights, ω^int, AIP torsor, Theorem 7.14)

### PIL20

Vincent Pilloni, [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf). Duke Math. J. 169 (2020), 1647–1807; author copy complexhidatheorygsp4.pdf (113 pp.). Read 2026-10-08. SHA-256 `4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58`.

**Sections used.**

- §6 (Hasse invariants, LF, Lemma 6.3.4.1)
- §§7, 9 (degrees of subgroups, Hodge–Tate isomorphism)
- §12 (ω^mod, ω^{mod,+}, 𝔛(p^n)^{⋆−mod})
- §14 (Fargues degree, δ_H, inverse different)

### PS16

Vincent Pilloni, Benoît Stroh, [Cohomologie cohérente et représentations galoisiennes](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf). Ann. Math. Québec 40 (2016), 167–202; author copy koko.pdf (31 pp.), numbered differently from the published version. Read 2026-10-08. SHA-256 `2c9f90c39f0efacd3fa076ef189b1d552da900d1968e34c3c8b3e551dcb4e3a1`.

**Sections used.**

- §1, Propositions 1.2, 1.5, Corollary 1.7, Theorem 1.9, Remark 1.10 and Lemma 1.12, pp. 3–8; §1.4 minor modifications; Appendix A.5, Corollary A.10

### BP26

George Boxer, Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf). Invent. Math. (2026); author copy higherhidaSiegel.pdf (65 pp.). Read 2026-10-08. SHA-256 `af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6`.

**Sections used.**

- §4.1 (Iwahori flags, divisors D_i)
- §4.2 (degrees, Proposition 4.2.8, Corollary 4.2.10, Propositions 4.2.14–4.2.15)
- §6.1.8

### BCGP21

George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/abs/1812.09269). arXiv:1812.09269v3 (28 Nov 2021); published Publ. Math. IHÉS 134 (2021) (not collated). Read 2026-10-08. SHA-256 `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed`.

**Sections used.**

- §4.3.6
- §6.1.4 (Hodge–Tate map at level p^n, ω^mod)
- §6.2.1 (minimal compactification at level p^n)
- §6.5.1 (degree, δ_H)

### CS17

Ana Caraiani, Peter Scholze, [On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418). arXiv:1511.02418v1 (8 Nov 2015); published Ann. of Math. 186 (2017), Proposition 2.3.9 collated at pp.673–674. Read 2026-10-08. SHA-256 `aa93df3947e57ab78b070a82d638e70c25ae2ae15aeb60346575e74fdf85b349`.

**Sections used.**

- §2.1–2.3 (Theorems 2.1.2–2.1.3, relative Hodge–Tate filtration, Lemmas 2.3.6–2.3.8, Proposition 2.3.9)
- §4.1–4.2 (Theorem 4.1.4, Propositions 4.2.5–4.2.6, Remark 4.2.8)

### SW13

Peter Scholze, Jared Weinstein, [Moduli of p-divisible groups](https://arxiv.org/abs/1211.6357). arXiv:1211.6357v2 (13 Apr 2013); Camb. J. Math. 1 (2013). Read 2026-10-08. SHA-256 `984411ef6c3d735a713684d4c9251fbad411a40eab33cefed8ab5c8412b09f6d`.

**Sections used.**

- Introduction
- §§4.1–4.3 (Theorem 4.1.4, Proposition 4.3.6)
- §5 (Theorem 5.1.4, Proposition 5.1.6, Theorem 5.2.1)
- §7.1 (Proposition 7.1.1)

### AIPH

Fabrizio Andreatta, Adrian Iovita, Vincent Pilloni, [The adic, cuspidal, Hilbert eigenvarieties](https://www.imo.universite-paris-saclay.fr/~pilloni/Hilbert_adicfinal.pdf). Res. Math. Sci. 3 (2016); author copy Hilbert_adicfinal.pdf dated 16 May 2016 (40 pp.). Read 2026-10-08. SHA-256 `34f517fd8d02d778f16f19745f4303b3955d48646d0ce6665b88a10f6fcdebbd`.

**Sections used.**

- §3 (Hilbert canonical subgroups, Propositions 3.2–3.3, Igusa covers)
- §4 (Proposition 4.1, the torsor F_{n,r,I}, Proposition 4.7)
- §6, Theorem 6.7(1)–(3), PDF p. 29

### AIP15

Fabrizio Andreatta, Adrian Iovita, Vincent Pilloni, [p-adic families of Siegel modular cuspforms](https://arxiv.org/abs/1212.3812). arXiv:1212.3812v1 (16 Dec 2012); published Ann. of Math. 181 (2015), 623–697 (not collated). Read 2026-10-08. SHA-256 `546120d2dcbf50bc86a3b980602728c9dcebd90cc2b08528df4415ec2f7ea851`.

**Sections used.**

- §3 (Theorem 3.1.1 after Fargues, Propositions 3.1.2, 3.2.1, 3.2.2)
- §6.2.1, Proposition 6.2.1.1, PDF p.29 (anticanonical quotient, auxiliary restricted range)

### HALO

Fabrizio Andreatta, Adrian Iovita, Vincent Pilloni, [Le halo spectral](https://mypage.concordia.ca/mathstat/iovita/Halo_spectral.pdf). Author copy Halo_spectral.pdf; Appendix A. Read 2026-10-08. SHA-256 `154459bdefa0e91b5a103ba5a78d81bcced20e67d8bb9a0fb737de22494bee27`.

**Sections used.**

- Appendix A.1–A.3, Propositions A.1–A.3, Lemma A.2, Corollary A.2, pp. 37–41

### CDM12

Peter Scholze, [Perfectoid spaces: a survey](https://people.mpim-bonn.mpg.de/scholze/CDM.pdf). Current author copy of the 2012 Current Developments in Mathematics survey. Read 2026-10-08. SHA-256 `85a0b85e13163d8953c25d521c7f568afcc2a67c8f192228a8608f533b5f11eb`.

**Sections used.**

- §4, Theorem 4.13, Remark 4.14 and Proposition 4.15, pp. 27–29
- Theorem 3.20 and Remark 3.21, PDF p.20 (absolute algebraic Hodge–Tate spectral sequence)

### ZIE

Paul Ziegler, [Graded and filtered fiber functors on Tannakian categories](https://arxiv.org/pdf/1111.1981v2). arXiv:1111.1981v2. Read 2026-10-08. SHA-256 `7e553f590404cd31f92bf528d925755043ad4e2bb009e058a6ca39ab8d39ed40`.

**Sections used.**

- §3.1, Definition 3.4, PDF p. 15; Theorems 3.14–3.15, PDF p. 17; Theorem 3.52, PDF pp.27–28

### BPC25

George Boxer, Vincent Pilloni, [Higher Coleman theory](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf). Author revised manuscript dated 3 March 2025, HigherColeman.pdf (180 pp.); this receipt pins the actual bytes read. Read 2026-10-08. SHA-256 `d340c9a020cc5fdbca781a8630b6fae35e14607142bed700d6ab82334faa80ae`.

**Sections used.**

- §4.4.8, pp.67–68; Remark 4.4.12, p.69; §4.4.22–4.4.24, pp.73–75 (relative tensor torsors, cyclotomic comparison and Hodge-type map)

Lan’s corrected author compilation and errata were read at Definition 8.5 and Theorems 8.6–8.7 (PDF p.34); errata item (3) adds the dimension-one boundary exception. E27 remains rejected as a source-error allegation. Concrete C5 model/coefficient and mod-p^k pushforward applications remain open. No uncleared Illusie, Huber or Faltings–Chai copy was read.

Additional version receipts:

- [Published AIF 73 (2023), 1709–1794; collated §5 and §7 for E20–E25.](https://www.numdam.org/item/10.5802/aif.3560.pdf); published; recorded read 2026-10-07; SHA-256 `d59b7f701eb5258c351d959be08d49f17946245ed1e5779317d2371981c2c5c4`.
- [Published Annals 182 (2015), 945–1066; collated the §III.3 chart-permutation sentence.](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf); published; recorded read 2026-10-07; SHA-256 `ebac854f47381c19a987b43b59d2c05cad55c3186c4d8cde067a7be0d06cbd16`.
- [Kai-Wen Lan, Integral models of toroidal compactifications with projective cone decompositions, IMRN 2017, no. 11, 3237–3280, doi:10.1093/imrn/rnw123; author compilation incorporates known errata. Read Definition 8.5 and Theorems 8.6–8.7.](https://www.kwlan.org/articles/cpt-ram-nbl.pdf); author copy; recorded read 2026-10-08; SHA-256 `ff2229d32fc6dd99174d8ff392ebdf6c93c3a455118bd7d54f54a74a967d31ac`.
- [Integral models of toroidal compactifications with projective cone decompositions — Errata; author errata linked from Lan’s academic page. Item (3) adds the dimension-one boundary exception to Theorem 8.7.](https://www.kwlan.org/articles/cpt-ram-nbl-err.pdf); author errata; recorded read 2026-10-08; SHA-256 `e0ecf94c74332660867965dc9877836ef97f2a03161c53b5f0ff1a1a7f616b04`.
- [Caraiani–Scholze, Annals 186 (2017), 649–766; Proposition 2.3.9 and proof, pp.673–674: raw untwisted comparison persists](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf); published version; recorded read 2026-10-08; SHA-256 `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a`.

## Pinned-library boundary

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. data/library-coverage.json has no reviewed record for HodgeTateAndCanonicalSubgroups:T0–T5; the unreviewed AUDIT-37 finds every target not built (only Cartier duality, the cotangent space of a Hopf ideal, Kähler differentials, Module.Grassmannian, BDeRhamPlus and the dynamic parabolic exist). Tau Ceti's TauCeti.Bialgebra.CotangentSpace (ker ε/(ker ε)² over any commutative ring) is ω_H for an affine group scheme, and FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality gives H(S) = Hom(H^D, 𝔾_m): together they carry the finite-level Hodge–Tate map. No Fitting-ideal API exists in Mathlib (only LieModule Fitting decompositions).

All 29 cited declaration statements and surrounding hypotheses were independently read at these pins. The malformed unqualified Cartier-duality index alias stays removed; its fully qualified source API is documented through the category entry. Carrier declarations are not treated as the missing geometric/comparison theorems. The orchestrator owns the separate index repair.

- `tauceti:TauCeti.Bialgebra.AugmentationIdeal` (abbrev, `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean`): The augmentation ideal ker ε of a commutative bialgebra over a commutative ring.
- `tauceti:TauCeti.Bialgebra.CotangentSpace` (abbrev, `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean`): The cotangent space (ker ε)/(ker ε)² at the identity of the affine monoid of a commutative bialgebra over any commutative ring: ω_H for an affine group scheme.
- `tauceti:TauCeti.Bialgebra.cotangentMap` (def, `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean`): The R-linear map a ↦ [a − ε(a)] into the cotangent space; on a group-like element g it is the class of g − 1, i.e. dt/t pulled back.
- `tauceti:TauCeti.Bialgebra.cotangentMap_mul` (lemma, `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean`): Leibniz rule cotangentMap(ab) = ε(a)·cotangentMap(b) + ε(b)·cotangentMap(a), giving additivity on group-like elements.
- `tauceti:TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat` (abbrev, `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean`): The category of finite locally free (finite, flat, locally of finite presentation) commutative affine group schemes over an affine base. Its pinned source also defines TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality, independently checked here. The declaration index incorrectly omits its TauCeti prefix; the erroneous index reference is removed and this source-checked category entry documents the associated duality API.
- `tauceti:TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso` (abbrev, `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/BaseChange.lean`): Cartier duality commutes with base change R → S.
- `tauceti:TauCeti.Cocharacter.parabolic` (def, `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`): Dynamic parabolic as a subgroup of algebra-valued points. This does not alone provide representability or a parabolic group-scheme torsor API.
- `tauceti:TauCeti.Cocharacter.levi` (def, `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`): Dynamic Levi as a subgroup of algebra-valued points. Representability and the quotient morphism of group schemes require additional theory.
- `tauceti:TauCeti.Huber.Pair` (structure, `TauCeti/RingTheory/Huber/Pair.lean`): A Huber pair (A, A⁺): a ring of integral elements of a Huber ring.
- `mathlib:Ideal.Cotangent` (def, `Mathlib/RingTheory/Ideal/Cotangent.lean`): I/I² as a module, the carrier of TauCeti.Bialgebra.CotangentSpace.
- `mathlib:KaehlerDifferential` (def, `Mathlib/RingTheory/Kaehler/Basic.lean`): Kähler differentials Ω_{S/R} of a ring map.
- `mathlib:IsGroupLikeElem` (structure, `Mathlib/RingTheory/Coalgebra/GroupLike.lean`): Group-like elements of a coalgebra: ε(a) = 1 and Δ(a) = a ⊗ a; these are the characters of the Cartier dual.
- `mathlib:Module.Grassmannian` (structure, `Mathlib/RingTheory/Grassmannian.lean`): Submodules of M with locally free quotient of rank k (rank-k quotients), with base change: the ambient space of the Hodge–Tate flag point.
- `mathlib:Module.Invertible` (class, `Mathlib/RingTheory/PicardGroup.lean`): Invertible modules (line bundles over a ring).
- `mathlib:Module.length` (def, `Mathlib/RingTheory/Length.lean`): The length of a module; used only to state that the Fargues degree is not the length.
- `mathlib:LinearMap.det` (irreducible_def, `Mathlib/LinearAlgebra/Determinant.lean`): Determinant of an endomorphism; finite free hypotheses give its usual properties. It does not supply determinants of maps between different vector bundles or determinant lines of complexes.
- `mathlib:Valuation` (structure, `Mathlib/RingTheory/Valuation/Basic.lean`): Multiplicative valuations in a linearly ordered commutative monoid with zero; a real additive valuation used for Fargues degree requires an explicit conversion and normalisation.
- `mathlib:ValuationSubring` (structure, `Mathlib/RingTheory/Valuation/ValuationSubring.lean`): Valuation subrings of a field.
- `mathlib:PadicInt` (def, `Mathlib/NumberTheory/Padics/PadicIntegers.lean`): The p-adic integers ℤ_p.
- `mathlib:PadicComplex` (abbrev, `Mathlib/NumberTheory/Padics/Complex.lean`): ℂ_p, the completion of an algebraic closure of ℚ_p.
- `mathlib:IsAdicComplete` (class, `Mathlib/RingTheory/AdicCompletion/Basic.lean`): I-adic completeness (Hausdorff and precomplete).
- `mathlib:AlgebraicGeometry.Scheme` (structure, `Mathlib/AlgebraicGeometry/Scheme.lean`): Schemes.
- `mathlib:AlgebraicGeometry.Scheme.Hom.normalization` (def, `Mathlib/AlgebraicGeometry/Normalization.lean`): Relative normalisation of the target of a scheme morphism in its source; normalisation of admissible formal schemes is instead requested from AdicSpacesPartII R2.
- `mathlib:AlgebraicGeometry.Scheme.Modules` (def, `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean`): The category of actual module sheaves over X.ringCatSheaf; the global conormal carrier is not merely a ring module.
- `mathlib:AlgebraicGeometry.Scheme.Modules.pullback` (def, `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean`): Pullback of module sheaves along a scheme morphism; applied to the unit section and supplied relative differentials.
- `mathlib:SheafOfModules.Submodule` (structure, `Mathlib/Algebra/Category/ModuleCat/Sheaf/Submodule.lean`): A presheaf submodule with local membership, its associated sheaf and monomorphic inclusion; used for integral image lattices.
- `mathlib:SheafOfModules.IsLocallyFree` (class, `Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean`): Local generator maps are isomorphisms; this needs the declared sheafification hypotheses and is not a pointwise rank condition.
- `mathlib:CategoryTheory.Grp` (structure, `Mathlib/CategoryTheory/Monoidal/Grp.lean`): Group objects in a Cartesian monoidal category, giving actual geometric group carriers rather than a predicate.
- `mathlib:GroupLike` (structure, `Mathlib/RingTheory/Coalgebra/GroupLike.lean`): The bundled group-like elements of a coalgebra; Hopf algebras give their group structure and actual character-domain type.

## T0 — The local part constructs global conormal/character interfaces, valuation degree and HN geometry from their actual suppliers. The boundary part applies them to the separate Raynaud/one-motive carriers. The proposed split listed below assigns every node.

### T0/conormal-module — The conormal module ω_H of a finite locally free group scheme

**Definition** · proposed name `TauCeti.HodgeTate.conormal` · implementation unchecked.

For a finite locally free commutative S-group H with unit e, define ω_H=e*Ω¹_{H/S}, as a finitely presented O_S-module. If S=Spec R and H=Spec A, identify it canonically with the existing TauCeti.Bialgebra.CotangentSpace R A=(ker ε)/(ker ε)²; this is an identification with the baseline, not a new affine cotangent theory. For a p-divisible G over O_C, use the R07.1 conormal module ω_G and its isomorphisms ω_{G[p^n]}≅ω_G/p^n; it is free of rank dim G. Complete-noetherian-local dimension theorems alone do not supply this O_C assertion.

**Hypotheses.**

- S is arbitrary for the finite locally free conormal sheaf; relative differentials and finitely presented module sheaves are imported.
- The p-divisible assertion is over O_C, C complete algebraically closed of mixed characteristic (0,p), or another base explicitly covered by the supplier. No arbitrary complete-ring local-freeness assertion is made.

**Proof route.**

- Construct e*Ω¹ and identify its affine presentation with I/I² using the counit; glue through the relative-differentials pullback API.
- Finite presentation follows from finite presentation of H/S. Arbitrary base change and right exactness are the separately named conormal lemmas below.
- Import the O_C conormal/dimension extension of R07.1; use its finite-level reduction and completeness to identify the inverse system.

**Acceptance instances.**

- ω_{ℤ/p^n} = 0 over any base (étale group).
- ω_{μ_{p^n}} over ℤ_p is ℤ_p/p^n, generated by the class of t − 1 (= dt/t).
- ω_{α_p} over 𝔽_p is one-dimensional, so ω does not detect the order of H alone.

**Inputs.**

- `tauceti:TauCeti.Bialgebra.CotangentSpace`
- `tauceti:TauCeti.Bialgebra.cotangentMap`
- `tauceti:TauCeti.Bialgebra.AugmentationIdeal`
- `tauceti:TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`
- `mathlib:Ideal.Cotangent`
- `mathlib:KaehlerDifferential`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-dimension`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`
- `mathlib:AlgebraicGeometry.Scheme.Modules`
- `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`

**Source matches.**

- FAR10, §2, before Définition 3, PDF p. 7: Fargues fixes ω_G as the conormal sheaf of the unit section; the node takes the same definition and computes it as the augmentation cotangent space.

**Uses.**

- Fargues 2010, §2, Définition 3: δ_G = Fitt₀ ω_G defines the degree
- Scholze–Weinstein 2013 and Fargues 2010, Définition 17: target of the Hodge–Tate map α_G: G(O_C̄) → ω_{G^D}
- HodgeTateAndCanonicalSubgroups:T5 (ω^int, ω^mod): the modified lattices are sub-O⁺-modules of ω_A = ω_{A[p^∞]} generated by Hodge–Tate images

**Planning API.**

- `TauCeti.HodgeTate.conormal` (constructor): ω_H := e*Ω¹_{H/S}, over Spec R the augmentation cotangent space I/I² of the Hopf algebra of H.
- `TauCeti.HodgeTate.conormal_eq_cotangentSpace` (compatibility): Over Spec R, ω_H is TauCeti.Bialgebra.CotangentSpace R A for H = Spec A (definitional for the affine carrier).
- `TauCeti.HodgeTate.conormal_map` (functoriality): A homomorphism f: H → H′ induces f*: ω_{H′} → ω_H, with (id)* = id and (g∘f)* = f*∘g*.
- `TauCeti.HodgeTate.conormal_baseChange` (functoriality): For a base change S′→S, the canonical pullback map ω_H⊗O_{S′}→ω_{H_{S′}} is an isomorphism.
- `TauCeti.HodgeTate.conormal_rightExact` (relation): For an fppf-exact sequence 0→H′→H→H″→0 of finite locally free commutative groups, ω_{H″}→ω_H→ω_{H′}→0 is right exact; injectivity on the left is not asserted.
- `TauCeti.HodgeTate.conormal_finitePresentation` (instance): ω_H is a finitely presented R-module, killed by the order |H| when |H| is a non-zero-divisor.
- `TauCeti.HodgeTate.conormal_eq_zero_iff_etale` (characterisation): ω_H = 0 if and only if H is étale over S.
- `TauCeti.HodgeTate.pDivisibleConormal` (constructor): The R07.1 conormal module ω_G over O_C, with ω_{G[p^n]}≅ω_G/p^n and the inverse-limit identification; no second p-divisible object is introduced.

**Mathematical tests.**

- `TauCeti.HodgeTate.conormal_constant_eq_zero` (degenerate): For the constant group (ℤ/p^n)_R over any ring R, ω = 0.
- `TauCeti.HodgeTate.conormal_mu` (computation): For μ_{p^n} = Spec R[t]/(t^{p^n} − 1), ω ≅ R/p^n R, generated by the class of t − 1.
- `TauCeti.HodgeTate.conormal_alphaP` (non-example): For α_p = Spec 𝔽_p[t]/(t^p) over 𝔽_p, ω is one-dimensional although α_p has order p and is not étale; ω_{α_p} ≠ 0 = ω_{ℤ/p}, so the order of H does not determine ω.
- `TauCeti.HodgeTate.conormal_eq_cotangentSpace_test` (compatibility): For the Hopf algebra A of H over R, the R-module ω_H equals (ker ε)/(ker ε)², i.e. TauCeti.Bialgebra.CotangentSpace R A.

### T0/finite-hodge-tate-map — The finite-level Hodge–Tate map

**Construction** · proposed name `TauCeti.HodgeTate.hodgeTateMap` · planet **Hodge–Tate map** · implementation unchecked.

Let H be a finite locally free commutative group scheme over a scheme S, with Cartier dual H^D = Hom(H, 𝔾_m). A point x ∈ H(S) is, by Cartier duality, a homomorphism x: H^D_S → 𝔾_{m,S}; the Hodge–Tate map α_H: H(S) → ω_{H^D} sends x to x*(dt/t), the pullback of the invariant differential dt/t of 𝔾_m. Over S = Spec R, x corresponds to a group-like element g_x of the Hopf algebra of H^D and α_H(x) is the class of g_x − 1 in I/I². α_H is a homomorphism of groups, natural in H and compatible with base change; its R-linearisation is α_H ⊗ 1: H(R) ⊗_ℤ R → ω_{H^D}. When H(S) is replaced by H(S′) for an S-scheme S′ (for S = Spec O_K, S′ = Spec O_K̄), the same formula gives α_H: H(O_K̄) → ω_{H^D} ⊗ O_K̄.

**Hypotheses.**

- H finite locally free and commutative over S.
- Convention (pinned): α_H goes from points of H to the conormal module of the dual H^D. For an abelian scheme A, applied to H = A^∨[p^n] (whose Cartier dual is A[p^n] by the Weil pairing) it gives A^∨[p^n] → ω_A/p^n, the finite level of the map T_pA^∨ ⊗ C → ω_A displayed in the roadmap.

**Proof route.**

- Identify H(S) with Hom(H^D, 𝔾_m) by Cartier duality (Tau Ceti FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality) and, over Spec R, with the group-like units of the Hopf algebra of H^D.
- Additivity: (gh − 1) = (g − 1) + (h − 1) + (g − 1)(h − 1) and the last term lies in I², so x ↦ [g_x − 1] is additive (the Leibniz rule TauCeti.Bialgebra.cotangentMap_mul).
- Naturality and base change follow from those of Cartier duality (cartierDualBaseChangeIso) and of ω (T0/conormal-module).

**Acceptance instances.**

- α_{μ_{p^n}}: μ_{p^n}(R) → ω_{ℤ/p^n} = 0 is zero, and α_{ℤ/p^n}: ℤ/p^n → ω_{μ_{p^n}} = R/p^n sends 1 to dt/t.
- α_H is additive and natural in H.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/conormal-module`
- `tauceti:TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`
- `tauceti:TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso`
- `tauceti:TauCeti.Bialgebra.cotangentMap_mul`
- `mathlib:IsGroupLikeElem`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`
- `mathlib:GroupLike`
- `mathlib:CategoryTheory.Grp`
- `HodgeTateAndCanonicalSubgroups:T0/conormal-base-change`

**Source matches.**

- FAR10, §9.2, Définition 17, PDF p. 25: Fargues's Hodge–Tate map α_G: G(O_K̄) → ω_{G^D} ⊗ O_K̄, with the direction pinned here.
- SW13, §5.1, Proposition 5.1.6 and its proof (arXiv:1211.6357v2), PDF p. 50: The map T_pG → ω_{G^∨} sends a point, viewed as a map from the dual to μ_{p^∞}, to the pullback of dt/t.
- AIP15, §3.2, the Hodge–Tate map (arXiv:1212.3812), PDF p. 12: AIP's definition x ↦ x*(dt/t) of the Hodge–Tate map of a finite flat group scheme.

**Uses.**

- Fargues 2010, Théorème 7: its cokernel after ⊗ O_K̄ is bounded by p^{1/(p−1)}
- Fargues 2011 and AIP 2015: the canonical subgroup is characterised through α of the dual
- HodgeTateAndCanonicalSubgroups:T2: the Hodge–Tate exact sequence is built from α
- HodgeTateAndCanonicalSubgroups:T5: ω^int and ω^mod are generated by the image of α at level p^n

**Planning API.**

- `TauCeti.HodgeTate.hodgeTateMap` (constructor): α_H: H(S) → ω_{H^D}, x ↦ x*(dt/t), through Cartier duality.
- `TauCeti.HodgeTate.hodgeTateMap_add` (simp): α_H(x + y) = α_H(x) + α_H(y) and α_H(0) = 0.
- `TauCeti.HodgeTate.hodgeTateMap_apply_groupLike` (characterisation): Over Spec R, α_H(x) is the class of g_x − 1 in I/I², g_x the group-like element of the Hopf algebra of H^D attached to x.
- `TauCeti.HodgeTate.hodgeTateMap_natural` (functoriality): For f: H → H′ with Cartier dual f^D: H′^D → H^D, α_{H′}(f(x)) = (f^D)*(α_H(x)) in ω_{H′^D}, where (f^D)*: ω_{H^D} → ω_{H′^D}.
- `TauCeti.HodgeTate.hodgeTateMap_baseChange` (functoriality): For R → R′, α_{H_{R′}} restricted to H(R) is α_H followed by ω_{H^D} → R′ ⊗ ω_{H^D}.
- `TauCeti.HodgeTate.hodgeTateLinear` (constructor): The linearisation α_H ⊗ 1: H(R′) ⊗_ℤ R′ → R′ ⊗_R ω_{H^D} for an R-algebra R′.

**Mathematical tests.**

- `TauCeti.HodgeTate.hodgeTateMap_constant` (computation): For H = (ℤ/p^n)_R, α_H(1) is the class of t − 1 in ω_{μ_{p^n}} = R/p^n, a generator.
- `TauCeti.HodgeTate.hodgeTateMap_mu_eq_zero` (degenerate): For H = μ_{p^n,R}, α_H = 0 because ω_{H^D} = ω_{ℤ/p^n} = 0.
- `TauCeti.HodgeTate.hodgeTateMap_depends_on_model` (non-example): Over R = ℤ_p[ζ_p] the groups ℤ/p and μ_p have isomorphic generic fibres, yet α_{ℤ/p}(1) generates ω_{μ_p} ≅ R/p while α_{μ_p} = 0: the Hodge–Tate map depends on the integral model, not only on the generic fibre.
- `TauCeti.HodgeTate.hodgeTateMap_cotangentMap` (compatibility): Over Spec R, α_H(x) = TauCeti.Bialgebra.cotangentMap R A(g_x) for A the Hopf algebra of H^D.

### T0/hodge-tate-map-compatibilities — Functoriality, endomorphisms and polarisations of the Hodge–Tate map

**Theorem** · proposed name `TauCeti.HodgeTate.hodgeTateMap_compatibilities` · implementation unchecked.

Let S be a scheme. (1) For a homomorphism f: H → H′ of finite locally free commutative S-group schemes, α_{H′} ∘ f = (f^D)* ∘ α_H as maps H(S) → ω_{H′^D}. (2) If a ring 𝒪 acts on H by endomorphisms, α_H is 𝒪-equivariant for the induced action on ω_{H^D} through the dual action a ↦ (a^D)*. (3) For an abelian scheme A/S with polarisation λ: A → A^∨ and n ≥ 1, write e_n: A[p^n] × A^∨[p^n] → μ_{p^n} for the Weil pairing; then, identifying A[p^n]^D = A^∨[p^n] by e_n, the maps α_{A[p^n]}: A[p^n](S) → ω_{A^∨}/p^n and α_{A^∨[p^n]}: A^∨[p^n](S) → ω_A/p^n satisfy α_{A^∨[p^n]}(λx) = λ*(α_{A[p^n]}(x)) for x ∈ A[p^n](S), where λ*: ω_{A^∨} → ω_A; so λ exchanges the Hodge–Tate maps of A and A^∨. (4) The same holds for p-divisible groups with a quasi-polarisation λ: G → G^D (R07.1/p-divisible-cartier-dual).

**Hypotheses.**

- (3) uses the sign convention of the Weil pairing fixed in AbelianSchemesAndArithmeticModuli A3; with the opposite convention α is exchanged up to −1.

**Proof route.**

- (1) and (2) are the naturality of T0/finite-hodge-tate-map applied to f and to the endomorphisms.
- (3) The polarisation identifies A[p^n] → A^∨[p^n] compatibly with Cartier duality and the Weil pairing (A3); apply (1) to λ and use (λ^∨)|_{A[p^n]} = λ up to the symmetry of λ.
- (4) is (1) for the levels of λ.

**Acceptance instances.**

- For E an elliptic curve with its principal polarisation, α_{E[p^n]} and α_{E^∨[p^n]} coincide under E ≅ E^∨.
- For 𝒪_F acting on a Hilbert–Blumenthal abelian scheme, α is 𝒪_F-linear, so its image is an 𝒪_F ⊗ R-submodule of ω.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/finite-hodge-tate-map`
- `AbelianSchemesAndArithmeticModuli:A3`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`

**Source matches.**

- FAR10, §9.2, Définition 17, PDF p. 25: Fargues uses the functoriality of α_G in G throughout §9 (the Hodge–Tate triple is functorial).

### T0/p-divisible-hodge-tate-map — The Hodge–Tate map of a p-divisible group and its completed linearisation

**Construction** · proposed name `TauCeti.HodgeTate.pDivisibleHodgeTateMap` · planet **Hodge–Tate map of a p-divisible group** · implementation unchecked.

Let C/ℚ_p be complete algebraically closed and G/O_C a p-divisible group. The compatible character differentials α_{G[p^n]} give a ℤ_p-linear map α_G:T_pG→ω_{G^D}, using ω_{G^D[p^n]}=ω_{G^D}/p^n and p-adic completeness. Its O_C-linearisation T_pG⊗O_C→ω_{G^D} is natural in G. For a group descending to a mixed-characteristic valuation subfield K, it is equivariant for the continuous Galois action. The source is the Tate module of R07.1 and the target its O_C conormal module, not newly defined objects.

**Hypotheses.**

- Use the supplier conormal and finite-level reduction theorem over O_C, not R07.1’s complete-noetherian-local dimension statement.
- The transition on G[p^{n+1}] is multiplication by p; conormal transition maps are the corresponding reductions on the dual group.

**Proof route.**

- For a compatible Tate point (x_n), take α_{G[p^n]}(x_n); finite-level naturality identifies its reduction at every smaller level.
- Use ω_{G^D}≅lim_n ω_{G^D}/p^n to form α_G. Linearisation is extension of scalars from ℤ_p to O_C.
- Naturality and the Galois formula follow at each finite level and then by uniqueness in the separated inverse limit.

**Acceptance instances.**

- For G = μ_{p^∞} over O_C, α_G: T_pμ_{p^∞} = ℤ_p(1) → ω_{ℚ_p/ℤ_p} = 0 is zero; for G = ℚ_p/ℤ_p, α_G: ℤ_p → ω_{μ_{p^∞}} = O_C·dt/t sends 1 to dt/t.
- For an abelian variety with good ordinary reduction the C-linearisation is surjective with kernel the Tate module of the multiplicative part tensored with C(1).

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/finite-hodge-tate-map`
- `HodgeTateAndCanonicalSubgroups:T0/hodge-tate-map-compatibilities`
- `HodgeTateAndCanonicalSubgroups:T0/conormal-module`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-tate-module`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`
- `mathlib:PadicInt`
- `mathlib:PadicComplex`
- `mathlib:IsAdicComplete`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`
- `HodgeTateAndCanonicalSubgroups:T0/finite-hodge-tate-naturality`

**Source matches.**

- SW13, §5.1, Proposition 5.1.6 and its proof (arXiv:1211.6357v2), PDF p. 50: Scholze–Weinstein define the Hodge–Tate map of a p-divisible group over O_C as the limit of the finite-level maps.

**Uses.**

- Scholze–Weinstein 2013, §4: the Hodge–Tate sequence of a p-divisible group over O_C
- HodgeTateAndCanonicalSubgroups:T2: the abelian Hodge–Tate sequence T_pA^∨ ⊗ C → ω_A
- PerfectoidShimuraVarieties:S1/continuous-hodge-tate-map: the period map is built from α on the tower

**Planning API.**

- `TauCeti.HodgeTate.pDivisibleHodgeTateMap` (constructor): α_G: T_pG(R) → ω_{G^D}, the inverse limit of α_{G[p^n]}.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_mod` (compatibility): α_G mod p^n equals α_{G[p^n]} composed with T_pG → G[p^n].
- `TauCeti.HodgeTate.pDivisibleHodgeTateLinear` (constructor): α_G ⊗ 1: T_pG ⊗_{ℤ_p} O_C → ω_{G^D} over O_C, and its C-linearisation.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_natural` (functoriality): Natural in homomorphisms of p-divisible groups, 𝒪-linear for endomorphism actions, exchanged under a quasi-polarisation.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_galois` (functoriality): For G over O_K, α_G ⊗ 1 is Gal(K̄/K)-equivariant.

**Mathematical tests.**

- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_QpZp` (computation): For G = ℚ_p/ℤ_p over O_C, α_G(1) = dt/t, so α_G ⊗ 1 is an isomorphism ℤ_p ⊗ O_C ≅ ω_{μ_{p^∞}}.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_mu` (degenerate): For G = μ_{p^∞}, α_G = 0.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_not_surjective_integrally` (non-example): For G = E[p^∞] with E supersingular over O_C, α_G ⊗ 1 is not surjective: its cokernel is nonzero and killed by p^{1/(p−1)} (T0/fargues-hodge-tate-cokernel), so the integral map is not a split surjection.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_tate` (compatibility): For G over the ring of integers of a complete discretely valued K with perfect residue field, α_G ⊗ C: T_pG ⊗ C → ω_{G^D} ⊗ C is the projection of Tate's decomposition T_pG ⊗ C ≅ (t_{G^D}(K)^∨ ⊗ C) ⊕ (t_G(K) ⊗ C(1)) (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1/hodge-tate-p-divisible) onto its first summand, t_{G^D}(K)^∨ = ω_{G^D} ⊗ K.

### T0/fargues-hodge-tate-cokernel — Fargues's bound on the cokernel of the Hodge–Tate map

**Theorem** · proposed name `TauCeti.HodgeTate.farguesHodgeTateCokernel` · planet **Fargues's Hodge–Tate cokernel bound** · implementation unchecked.

For a p-divisible G/O_C, put α:T_pG⊗_{ℤ_p}O_C→ω_{G^D}. For every a∈O_C with v(a)≥1/(p−1), a·coker α=0. The integral Faltings complex Lie(G)⊗O_C(1)→T_pG⊗O_C→ω_{G^D} has zero composite and all its cohomology annihilated by every such a. Thus it becomes exact over C. For a finite locally free p-power group H/O_C the analogous estimate is obtained after a finite-flat embedding into a p-divisible group under the exact embedding hypotheses supplied by R07.1; it is not inferred from a small-ramification uniqueness theorem.

**Hypotheses.**

- v(p)=1; C is complete and algebraically closed; Lie and ω are finite free over O_C.
- The finite-group extension is conditional on the finite-to-p-divisible embedding theorem, which is requested explicitly.

**Proof route.**

- Use the integral Faltings complex and annihilator estimate of Scholze CDM12 Theorem 4.13, together with the character description in Remark 4.14; this supplies both the zero composite and the integral cohomology bound.
- Fargues FAR10 Theorem 7/FAR11 Theorem 2 give the character-cokernel bound in the stated valuation-ring setting. For a finite group embed in a p-divisible group and use the right-exact conormal sequence.
- Invert p for the rational exactness. A bound on the final cokernel alone would not identify the middle kernel.

**Acceptance instances.**

- For G = μ_p over O_K the cokernel is ω_{ℤ/p} = 0; for G = ℤ/p the map is onto ω_{μ_p} = O_K/p.
- The bound is uniform: it depends neither on ht G nor on the ramification of K.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/finite-hodge-tate-map`
- `HodgeTateAndCanonicalSubgroups:T0/p-divisible-hodge-tate-map`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/oort-tate-classification`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`
- `HodgeTateAndCanonicalSubgroups:T0/conormal-right-exact`

**Source matches.**

- CDM12, Theorem 4.13 and Remark 4.14, PDF pp. 27–28: The integral complex has bounded cohomology and its last map is the differential of characters.
- FAR10, §9, Théorème 7, PDF p.26 (author copy; p≠2): The character map has uniformly bounded cokernel over an algebraically closed rank-one valued base.
- FAR11, §5.3.2, Théorème 2, PDF pp.24–25 (author copy): Restates the integral Hodge–Tate bound used for canonical subgroups.

### T0/fargues-degree — Fargues's degree of a finite flat group scheme

**Definition** · proposed name `TauCeti.HodgeTate.farguesDegree` · planet **Fargues degree** · implementation unchecked.

Let K be a henselian rank-one valued field of characteristic zero, O_K its valuation ring, v(p)=1, and G a finite locally free commutative group of constant p-power rank p^h. Its finitely presented torsion conormal module has principal nonzero Fitting ideal δ_G=Fitt₀(ω_G). Define deg G=v(δ_G)∈ℝ and, for h>0, μ(G)=deg G/h. In a cyclic presentation ω_G≅⊕_i O_K/(x_i), deg G=Σ_i v(x_i), without truncating at 1. The group-theoretic degree uses the shared Fitting theory; no second general Fitting-ideal definition is planned here.

**Hypotheses.**

- G is generically étale, as holds for finite p-power groups in characteristic zero; finite-flat conormal presentations over possibly nondiscrete valuation rings are required.
- Use shared finitely presented module/sheaf Fitting operations and R07.1’s valuation-ring specialization.

**Proof route.**

- Import Fitting ideals and their affine-sheaf compatibility from the existing StableReduction direction; request the nonnoetherian valuation extension and finite-flat specialization from R07.1.
- Diagonalize a finite presentation over the valuation ring to compute Fitt₀ω_G as (∏x_i); this proves the cyclic formula and presentation independence.
- The co-Lie divisor formulation is identified with this ideal through the determinant/co-Lie supplier, not through a determinant of an endomorphism alone.

**Acceptance instances.**

- deg (ℤ/p^n) = 0, deg μ_{p^n} = n, deg G[p^n] = n·dim G for a p-divisible group G.
- For G = Spec O_K[T]/(f), f monic with f(0) = 0, deg G = v(f′(0)).

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/conormal-module`
- `mathlib:Valuation`
- `mathlib:ValuationSubring`
- `mathlib:Module.length`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`

**Source matches.**

- FAR10, §2, Définition 3, PDF p. 7: Definition of the discriminant divisor δ_G.
- FAR10, §3, Définition 4, PDF p. 9: Definition of the degree.
- FAR10, Introduction, PDF p. 2: For a kernel of an isogeny f: A → B, deg is the valuation of det f* on ω; used as a test.

**Uses.**

- Fargues 2010, §§4–9: slopes and the Harder–Narasimhan filtration of finite flat group schemes
- Fargues 2011, Théorème principal: the canonical subgroup has degree d − w
- Bijakowski–Pilloni–Stroh 2016 and Pilloni 2020, §§6–13: degree functions on Siegel varieties cut out the loci where U_p improves
- Boxer–Pilloni (Siegel), §4.2: the divisors D_i and generic isomorphisms

**Planning API.**

- `TauCeti.HodgeTate.discriminantDivisor` (constructor): δ_G = Fitt₀ ω_G as an invertible ideal of O_S, for G generically étale over S.
- `TauCeti.HodgeTate.farguesDegree` (constructor): deg G := v(Fitt₀ ω_G) ∈ ℝ_{≥0} for G finite flat over O_K.
- `TauCeti.HodgeTate.farguesDegree_eq_sum` (characterisation): If ω_G ≅ ⊕ O_K/x_i then deg G = Σ v(x_i).
- `TauCeti.HodgeTate.fargueSlope` (constructor): For a nonzero group of p-power rank p^h, μ(G)=deg G/h. The zero object has degree zero and is excluded from slope comparisons.
- `TauCeti.HodgeTate.farguesDegree_isogeny` (compatibility): If G = ker(f: A → B) for an isogeny of abelian schemes or p-divisible groups over O_K, deg G = v(det(f*: ω_B → ω_A)).
- `TauCeti.HodgeTate.farguesDegree_monogenic` (example): For G = Spec O_K[T]/(f) with unit section T = 0, deg G = v(f′(0)) = Σ_{x ∈ G(O_K̄)∖0} v(x).

**Mathematical tests.**

- `TauCeti.HodgeTate.farguesDegree_constant` (degenerate): deg (ℤ/p^n)_{O_K} = 0.
- `TauCeti.HodgeTate.farguesDegree_mu` (computation): deg μ_{p^n, O_K} = n, since ω = O_K/p^n.
- `TauCeti.HodgeTate.farguesDegree_not_length` (non-example): deg is not the O_K-length of ω_G: for K with value group ℚ and G with ω_G ≅ O_K/p^{1/2}, the length is infinite (O_K is not noetherian) while deg G = 1/2.
- `TauCeti.HodgeTate.farguesDegree_ellipticTorsion` (computation): For E an elliptic curve over O_K with good reduction, deg E[p] = 1 (BT_1 of dimension 1).

### T0/fargues-degree-properties — Additivity, duality and extreme values of the degree

**Lemma** · proposed name `TauCeti.HodgeTate.farguesDegree_properties` · implementation unchecked.

Let G be finite flat commutative of p-power order over O_K (K, v as in T0/fargues-degree). (1) For an exact sequence 0 → G₁ → G₂ → G₃ → 0 of such group schemes, deg G₂ = deg G₁ + deg G₃ (over a general base, δ_{G₂} = δ_{G₁} + δ_{G₃}). (2) deg G + deg G^D = ht G (over a base where |G| is a non-zero-divisor, δ_G + δ_{G^D} = div |G|). (3) For a valued extension L/K, deg(G ⊗_{O_K} O_L) = deg G; for a flat S′ → S, δ commutes with pullback. (4) 0 ≤ deg G ≤ ht G; deg G = 0 iff G is étale, and deg G = ht G iff G is of multiplicative type; μ(G^D) = 1 − μ(G). (5) A truncated Barsotti–Tate group of level n and dimension d has degree nd; in particular deg G[p^n] = n·dim G for a p-divisible group G, and μ(G[p^n]) = dim G / ht G.

**Hypotheses.**

- (2) over a general base needs |G| locally a non-zero-divisor on S.

**Proof route.**

- (1) from the distinguished triangle of co-Lie complexes ℓ_{G₃} → ℓ_{G₂} → ℓ_{G₁} (Fargues 2010, Lemme 1).
- (2) locally write G = ker(f: A → B) for an isogeny of abelian schemes; the Hodge filtration triangle ℓ_G[−1] → H¹_dR(B) → H¹_dR(A) → ℓ^∨_{G^D} gives δ_G + δ_{G^D} = Div(det f* on H¹_dR) = div deg f = div |G| (Lemme 2).
- (3) Lemme 3 and the valuation of a Fitting ideal under faithfully flat base change.
- (4) from (2), Fitt₀ ω_G ⊂ O_K, and ω_G = 0 ⇔ G étale; (5) because ω of a BT_n of dimension d is locally free of rank d over O_K/p^n (Exemple 2).

**Acceptance instances.**

- deg μ_p + deg ℤ/p = 1 = ht.
- deg E[p] = 1 for an elliptic curve E with good reduction, and E[p] is neither étale nor multiplicative when E is supersingular.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-dimension`
- `AbelianSchemesAndArithmeticModuli:A4`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`

**Source matches.**

- FAR10, §2, Lemme 1, PDF p. 7: Additivity of δ on exact sequences.
- FAR10, §3, Lemme 4, PDF p. 9: Duality.
- FAR10, §3, Exemple 2, PDF p. 9: Extreme values.
- FAR10, §3, Exemple 2, PDF p. 9: Degree of a BT_n.

### T0/fargues-degree-generic-isomorphism — The degree increases along generic isomorphisms

**Theorem** · proposed name `TauCeti.HodgeTate.farguesDegree_genericIsomorphism` · planet **Degree along generic isomorphisms** · implementation unchecked.

Let f: G → G′ be a homomorphism of finite flat commutative group schemes over O_K inducing an isomorphism of generic fibres. Then deg G ≤ deg G′, with equality if and only if f is an isomorphism; more precisely deg G′ = deg G + (2/|G|)·χ(A, f*A′) where G = Spec A, G′ = Spec A′ and χ(A, f*A′) = v(Fitt₀(A/f*A′)) ≥ 0. Consequently, for G′ ↪ G → G″ with the first map a closed immersion, the composite zero and G/G′ → G″ a generic isomorphism, deg G ≤ deg G′ + deg G″ with equality iff G → G″ is flat (an fppf epimorphism). Over a discrete valuation ring the degree is strictly increasing on Raynaud's lattice of prolongations of a given generic group, and it is exchanged with ht − deg under Cartier duality.

**Hypotheses.**

- K of characteristic 0 complete for v with v(p) = 1; f an isomorphism on generic fibres (equivalently f*: A′ → A injective with torsion cokernel).

**Proof route.**

- Reduce to S = Spec A₀ affine with free Hopf algebras; with M the matrix of f*: B₂ ↪ B₁ and Q_i the trace forms, Q₂ = ᵗM Q₁ M, so (by the trace discriminant being the norm of the different, with group different generated by the unit pullback δ_G (FAR10 Proposition 1)) δ_{G₂}^n = det(M)² δ_{G₁}^n (Proposition 2).
- Take valuations (Proposition 3); χ ≥ 0 with equality iff f* is onto, i.e. f is an isomorphism (Corollaire 3).

**Acceptance instances.**

- The isogeny μ_p → … : for the generic isomorphism ℤ/p → μ_p over ℤ_p[ζ_p] given by 1 ↦ ζ_p, deg ℤ/p = 0 < 1 = deg μ_p, and the map is not an isomorphism.
- Boxer–Pilloni use the equality case: a generic isomorphism H₁ → H₂ with deg H₁ = deg H₂ is an isomorphism.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree-properties`
- `HodgeTateAndCanonicalSubgroups:T0/degree-different`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`

**Source matches.**

- FAR10, §2, Proposition 2, PDF p. 8: The precise change of δ along a generic isomorphism.
- FAR10, §3, Corollaire 3, PDF p. 10: Equality iff isomorphism.
- BP26, §4.2.8, proof of Proposition 4.2.8 (author copy), PDF p. 45: Boxer–Pilloni use the equality case in the proof of Proposition 4.2.8.

### T0/fargues-divisor — The divisor D_H of a generically étale finite flat group scheme

**Definition** · proposed name `TauCeti.HodgeTate.farguesDivisor` · implementation unchecked.

For a finite locally free commutative group G/S, assume its co-Lie complex is perfect of amplitude [−1,0] and rank zero, and that its generic étale locus meets every component. The determinant section defines the effective Cartier divisor δ_G, whose invertible ideal is Fitt₀ω_G. Its support is the non-étale locus, δ_G+δ_{G^D}=div(rank G), and it commutes with every base change on which the defining section remains regular. On a valuation chart its value is deg G. Equality with a pointwise divisor may be checked at codimension one only on an integral normal noetherian scheme; on formal/valuation bases use the affine Fitting and determinant identities instead.

**Hypotheses.**

- Use syntomicity, co-Lie determinants and duality from R07.6; require the determinant section to be regular for an effective Cartier divisor.
- The finite flat rank is locally constant and regular as a scalar for the duality divisor. Normality without noetherianity is not a codimension-one detection theorem.

**Proof route.**

- Import the co-Lie determinant and its Fitting comparison; the vanishing locus of ω_G is the étale locus.
- Apply the exact co-Lie triangle and the abelian-isogeny Hodge triangle supplied by A4 to obtain additivity and Cartier duality (FAR10 §2 Lemmes 1–2).
- For base change use the Fitting identity plus preservation of regularity; the divisor identity is not asserted when the pullback section is a zero divisor.

**Acceptance instances.**

- D_{μ_{p^n}} = V(p^n), D_{ℤ/p^n} = ∅.
- deg H_x is a locally constant function on the rigid generic fibre exactly when D_H is a multiple of V(p) locally.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree-properties`
- `AdicSpacesPartII:R2/admissible-formal-scheme`
- `mathlib:AlgebraicGeometry.Scheme`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`

**Source matches.**

- BP26, §4.1.8 (author copy), PDF p. 41: Boxer–Pilloni §4.1.8: the divisor D_H, its complement and D_H + D_{H^D} = V(p^h).

**Uses.**

- Boxer–Pilloni (Siegel), §§4.1.8, 4.2.7: the divisors D_i of the Siegel Hecke correspondences and D_i + D_{2g+1−i} = V(p^n)
- BCGP 2021, §6.5.1: δ_H at rank-one points computes Fargues's degree

**Planning API.**

- `TauCeti.HodgeTate.farguesDivisor` (constructor): D_H = Fitt₀ ω_H as an effective Cartier divisor of X.
- `TauCeti.HodgeTate.farguesDivisor_support` (characterisation): X ∖ Supp D_H is the largest open over which H is étale.
- `TauCeti.HodgeTate.farguesDivisor_add_dual` (relation): D_H + D_{H^D} = V(p^h) for H of order p^h.
- `TauCeti.HodgeTate.farguesDivisor_pullback` (functoriality): Base change pulls back δ_G whenever the pulled-back determinant section stays regular; in particular flat base change preserves the effective Cartier divisor.
- `TauCeti.HodgeTate.farguesDivisor_rankOne` (compatibility): At x: Spec V → X with V rank one, v(p) = 1, x*D_H = (a) with v(a) = deg H_x.

**Mathematical tests.**

- `TauCeti.HodgeTate.farguesDivisor_mu` (computation): D_{μ_{p^n}} = V(p^n).
- `TauCeti.HodgeTate.farguesDivisor_etale` (degenerate): D_H = 0 for H étale over X.
- `TauCeti.HodgeTate.farguesDivisor_not_reduced` (non-example): D_{μ_p} = V(p) is not the reduced special fibre when X = Spf ℤ_p[p^{1/2}]: there V(p) = 2·V(p^{1/2}), so D_H records multiplicities, not only support.

### T0/isogeny-divisor — The divisor of an isogeny of semi-abelian schemes and the section δ_H

**Construction** · proposed name `TauCeti.HodgeTate.isogenyDivisor` · implementation unchecked.

Let X be a normal ℤ_p-flat scheme (or formal scheme) and f: G → G′ an isogeny of semi-abelian schemes over X which is étale after inverting p. Lie(f): Lie G → Lie G′ is a map of locally free modules of the same rank; its determinant det Lie(f) is a section of det Lie(G)^{-1} ⊗ det Lie(G′), and the divisor of f is D_f := div(det Lie(f)). D_f is an effective Cartier divisor, D_{g∘f} = D_f + D_g, and over the open where ker f is finite D_f = D_{ker f} (T0/fargues-divisor). Over an analytic adic space 𝒳 with such an isogeny on a formal model, δ_H := det Lie(f) for H = ker f is a section with v_x(δ_H) = deg H_x at each rank-one point x for which the specialised kernel H_x is finite flat over O_{C_x}.

**Hypotheses.**

- ker f is in general only quasi-finite and flat at the boundary (ShimuraCompactifications C4/extended-isogeny-kernel), so D_f is defined through Lie(f), not through a finite group scheme.
- X normal and ℤ_p-flat, f étale after inverting p (so det Lie(f) is a non-zero-divisor).

**Proof route.**

- Lie G, Lie G′ are locally free of rank dim G (semi-abelian, C4/semi-abelian-scheme); det Lie(f) is a non-zero-divisor because f is étale after inverting p.
- Additivity: Lie(g∘f) = Lie(g)∘Lie(f).
- Where ker f = H is finite, ω_H = coker(f*: ω_{G′} → ω_G), so Fitt₀ ω_H = (det f*) = (det Lie f) (Fargues 2010, introduction).
- At rank-one points where the specialised kernel is finite flat, T0/fargues-divisor gives v_x(δ_H) = deg H_x; no degree of a non-finite kernel is asserted.

**Acceptance instances.**

- For f = [p] on an abelian scheme of dimension g, D_f = V(p^g).
- For a Tate curve with f the quotient by μ_p ⊂ 𝔾_m, D_f = V(p) although ker f is not finite over the cusp.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/fargues-divisor`
- `ShimuraCompactifications:C4/semi-abelian-scheme`
- `ShimuraCompactifications:C4/extended-isogeny-kernel`
- `mathlib:LinearMap.det`

**Source matches.**

- PIL20, §14.1 (author copy), PDF p. 92: Pilloni define the divisor of an isogeny of semi-abelian schemes by det Lie(f).
- BCGP21, §6.5.1 (arXiv:1812.09269v3), PDF p. 154: BCGP §6.5.1: the section δ_H and v_x(δ_H) = deg H_x.
- PIL20, §14.3 (author copy), PDF p. 93: Pilloni's section δ from the determinant of the differential of an isogeny.

**Uses.**

- Boxer–Pilloni (Siegel), §4.2: the divisors D_i of the Hecke correspondences, D_i + D_{2g+1−i} = V(p^n) (planned in HigherHidaAndColemanTheory)
- BCGP 2021, §6.5: the degree function on the Klingen tower via δ_H

**Planning API.**

- `TauCeti.HodgeTate.isogenyDivisor` (constructor): D_f := div(det Lie(f)) for an isogeny f of semi-abelian schemes, étale after inverting p.
- `TauCeti.HodgeTate.isogenyDivisor_comp` (relation): D_{g∘f} = D_f + D_g.
- `TauCeti.HodgeTate.isogenyDivisor_eq_farguesDivisor` (compatibility): Over the open where ker f is finite flat, D_f = D_{ker f}.
- `TauCeti.HodgeTate.deltaSection` (constructor): δ_H := det Lie(f) on an analytic adic space with a formal model; v_x(δ_H) = deg H_x when H_x is finite flat over the valuation ring at x.
- `TauCeti.HodgeTate.isogenyDivisor_mulP` (example): D_{[p]} = V(p^{dim G}).

**Mathematical tests.**

- `TauCeti.HodgeTate.isogenyDivisor_id` (degenerate): D_{id} = 0.
- `TauCeti.HodgeTate.isogenyDivisor_mulP_test` (computation): For [p] on an abelian scheme of relative dimension g, D_{[p]} = V(p^g).
- `TauCeti.HodgeTate.isogenyDivisor_kernel_not_finite` (compatibility): The quotient of the Tate curve by μ_p extends on the toric chart as t ↦ t^p, has finite flat kernel μ_p, and D_f = V(p). It is not a counterexample to D_f = D_{ker f}; this identity requires finite flatness of the kernel.

### T0/multiplicative-hodge-tate-isomorphism — The Hodge–Tate map of a group of multiplicative type is an isomorphism

**Lemma** · proposed name `TauCeti.HodgeTate.multiplicativeHodgeTateIso` · implementation unchecked.

Let H/R be finite locally free and étale-locally μ_{p^n}^r, with Cartier dual the étale sheaf M locally constant with fibre (ℤ/p^n)^r. The sheaf character map M⊗_ℤ𝒪_S→ω_H is an isomorphism. On a chosen split chart R′ it is the isomorphism (ℤ/p^n)^r⊗_ℤR′→ω_H⊗_RR′ induced by the constant character lattice. This holds on disconnected charts too; the tensor of the group of all global sections H^D(R′) with R′ is a different module. In particular the universal multiplicative subgroup on a Siegel or Hilbert–Siegel chart has this sheaf Hodge–Tate isomorphism.

**Hypotheses.**

- H étale-locally of multiplicative type μ_{p^n}^r; no hypothesis on p.
- Use the locally constant character sheaf, or its chosen constant fibre on a split chart, rather than all global sections of that sheaf.

**Proof route.**

- Reduce étale-locally to H = μ_{p^n}^r, H^D = (ℤ/p^n)^r; the standard basis maps to the r forms dt_i/t_i, a basis of ω_H ≅ (R/p^n)^r (T0/finite-hodge-tate-map, test hodgeTateMap_constant).
- Both sides commute with étale base change (T0/finite-hodge-tate-map, T0/conormal-module).

**Acceptance instances.**

- For H = μ_{p^n}, α_{ℤ/p^n}(1) = dt/t generates ω_{μ_{p^n}} = R/p^n.
- For R′=𝔽_p×𝔽_p and H=μ_p, M⊗R′≅R′, while H^D(R′)≅(ℤ/p)^2 and H^D(R′)⊗R′≅(R′)^2. The latter cannot be the source of the claimed isomorphism.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/finite-hodge-tate-map`
- `HodgeTateAndCanonicalSubgroups:T0/conormal-module`
- `HodgeTateAndCanonicalSubgroups:T0/conormal-base-change`

**Source matches.**

- PIL20, §9.4 (author copy), PDF p. 56: Pilloni: HT ⊗ O is an isomorphism for H_n étale-locally μ_{p^n}.

### T0/normalized-multiplicative-pullback — Boundary application of normalized multiplicative determinant pullback

**Lemma** · proposed name `TauCeti.HodgeTate.normalizedMultiplicativePullback_det` · implementation unchecked.

On a supplied boundary/Raynaud chart with a multiplicative p-divisible piece G and a multiplicative isogeny λ:G→G′, import R07.2’s normalized determinant pullback. For the étale character lattices T,T′, ω_G=T⊗ω_μ and λ induces λ₀:T′→T. If det λ₀=p^r u with u a unit on the determinant ℤ_p-line, its normalization gives an isomorphism λ̃*:detω_G′→detω_G and det λ*=p^r λ̃*. Pullback to the boundary chart and étale descent preserve this identity, including bases where p is nilpotent. The general multiplicative-group lemma belongs to R07.2; this node records its application with the boundary character convention.

**Hypotheses.**

- C4 supplies the actual multiplicative pieces, character lattices and compatible isogenies on the boundary chart.
- Normalize det λ₀ over ℤ_p before tensoring with 𝒪_S. The factorization det λ₀=p^r u does not imply λ₀=p·u as an endomorphism; arbitrary invariant factors are allowed.

**Proof route.**

- Import R07.2’s character-lattice determinant theorem (PIL20 Lemma 6.3.4.1, with character/cocharacter variance corrected).
- Apply it to the supplied multiplicative piece on each split boundary chart; conormal base change transports the identity. Descend using the compatible character-lattice maps on overlaps.

**Acceptance instances.**

- For λ = [p] on μ_{p^∞}, λ* = p on ω and λ̃* = id.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/conormal-module`
- `HodgeTateAndCanonicalSubgroups:T0/multiplicative-hodge-tate-isomorphism`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`
- `HodgeTateAndCanonicalSubgroups:T0/conormal-base-change`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`
- `ShimuraCompactifications:C4`

**Source matches.**

- PIL20, §6.3.4, Lemma 6.3.4.1 (author copy), PDF p. 34: Pilloni, Lemma 6.3.4.1.

### T0/semi-abelian-torsion — p-power torsion of semi-abelian schemes on degeneration charts

**Construction** · proposed name `TauCeti.HodgeTate.semiAbelianTorsion` · implementation unchecked.

For a semi-abelian S-group G with generic abelian dimension g, G[p^n] is a quasi-finite flat kernel; it need not be finite of constant abelian rank at the boundary. On a fixed complete henselian degeneration chart, the finite part is controlled by 0→T[p^n]→G̃[p^n]→B[p^n]→0, with T of rank r and B of dimension g−r, and has rank p^{n(2g−r)}. The polarized degeneration one-motive M=[Y→G̃], supplied by C4, restores the uniformizing lattice piece: 0→G̃[p^n]→M[p^n]→Y/p^n→0; the full finite-level carrier and overlap data must be those supplied on the chosen full-level chart. At the generic fibre T_pA is an extension of T_pG̃ by Y⊗ℤ_p. The character-differential map on the finite part factors through the abelian quotient and is zero on the toric Tate submodule because ω_{T[p^n]^D}=0.

**Hypotheses.**

- The assertions about finite parts are on the henselian formal/Raynaud charts of R07.1 and C4, not for an arbitrary quasi-finite kernel over an arbitrary S.
- The lattice Y and dual torus characters are distinguished; a polarization identifies them only through its specified pairing.
- Cartier duality applies to the finite locally free pieces and the supplied one-motive torsion, never to the whole quasi-finite boundary kernel by fiat.

**Proof route.**

- Import the finite-part/Raynaud chart descriptions and the polarized one-motive from C4; the toric and abelian ranks give the displayed finite-part rank.
- Use the exact torsion sequences and then the inverse-limit transition maps to obtain the Tate-module extension by Y⊗ℤ_p.
- Dualize the finite-part sequence and use right exactness of conormal modules; the conormal of the constant dual of T[p^n] vanishes, so α kills the toric Tate submodule.

**Acceptance instances.**

- For the Tate curve 𝔾_m/q^ℤ over ℤ_p((q)), E[p^n] = μ_{p^n} extended by ℤ/p^n generated by q^{1/p^n}, and over the cusp only μ_{p^n} remains finite.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/finite-hodge-tate-map`
- `HodgeTateAndCanonicalSubgroups:T0/multiplicative-hodge-tate-isomorphism`
- `ShimuraCompactifications:C4/semi-abelian-scheme`
- `ShimuraCompactifications:C4/semiabelian-tate-module`
- `ShimuraCompactifications:C4/extended-isogeny-kernel`
- `ShimuraCompactifications:C4/formal-universal-degeneration`
- `NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/finite-part-of-quasi-finite-group`
- `ShimuraCompactifications:C4`
- `HodgeTateAndCanonicalSubgroups:T0/finite-hodge-tate-naturality`

**Source matches.**

- SCH15, §3.3, Proposition 3.3.1 (arXiv v2, III.3.1), PDF p. 54: Scholze, Proposition 3.3.1: the Hodge–Tate filtration through the Raynaud extension of the connected Néron model.
- PIL20, §12.2.1 (author copy), PDF p. 74: Pilloni: HT over the toroidal boundary of 𝔛(p^n).

**Uses.**

- Scholze 2015, Proposition 3.3.1 and Lemma 3.3.2: Hodge–Tate filtration and Hasse invariant at boundary points
- Pilloni–Stroh 2016, Proposition 1.2; Pilloni 2020 p. 74: extension of HT over the toroidal boundary
- ShimuraCompactifications:C6/hilbert-hasse-boundary-comparison: the Hilbert Hasse ideal at the boundary

**Planning API.**

- `TauCeti.HodgeTate.semiAbelianTorsion` (constructor): The quasi-finite flat kernel G[p^n], with its separate finite locally free part on the supplied henselian chart; this is not a constant-height p-divisible family across strata.
- `TauCeti.HodgeTate.semiAbelianTorsion_finitePart_exact` (relation): 0 → T[p^n] → G[p^n]^f → B[p^n] → 0 on a stratum Z of torus rank r.
- `TauCeti.HodgeTate.semiAbelianTorsion_card` (characterisation): The finite part has order p^{n(2g−r)} on Z.
- `TauCeti.HodgeTate.semiAbelianTateModule_extension` (relation): For the supplied uniformization A^an=G̃^an/Y, 0→T_pG̃→T_pA→Y⊗ℤ_p→0 is exact on the generic fibre.
- `TauCeti.HodgeTate.semiAbelianHodgeTate_toric` (compatibility): α vanishes on the toric piece T[p^n], and the Hodge–Tate map of the dual of T[p^n] is the isomorphism of T0/multiplicative-hodge-tate-isomorphism onto ω_{T[p^n]}.

**Mathematical tests.**

- `TauCeti.HodgeTate.semiAbelianTorsion_abelian` (degenerate): For r = 0 (G abelian) the construction is A[p^n], finite locally free of order p^{2ng}.
- `TauCeti.HodgeTate.semiAbelianTorsion_torus` (computation): For G = 𝔾_m^g a split torus, G[p^n] = μ_{p^n}^g, of degree ng.
- `TauCeti.HodgeTate.semiAbelianTorsion_not_constant_height` (non-example): For the Tate curve over ℤ_p[[q]], E[p] is not finite over q = 0: its finite part there has order p, not p²; a constant-height p-divisible group over the chart does not exist.

### T0/semi-abelian-hasse-invariant — The Hasse invariant of a semi-abelian scheme

**Construction** · proposed name `TauCeti.HodgeTate.semiAbelianHasse` · planet **Hasse invariant of a semi-abelian scheme** · implementation unchecked.

Let S be an 𝔽_p-scheme and G a semi-abelian scheme of relative dimension g over S, with ω_G = e*Ω¹_{G/S} (locally free of rank g) and det ω_G its Hodge line. Let G^{(p)} be the pullback of G along the absolute Frobenius of S. The Verschiebung V: G^{(p)} → G (the Verschiebung of the smooth commutative group, compatible with Frobenius and multiplication by p; on the abelian locus it can also be constructed by duality, and on degeneration charts through the Raynaud extension) induces V*: ω_G → ω_{G^{(p)}} ≅ ω_G^{(p)}, and Ha(G/S) := det V* ∈ H⁰(S, (det ω_G)^{⊗(p−1)}). For G = A abelian this is Scholze's Ha(A/S), and it equals FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2's Hasse invariant Ha(A[p]) of the BT₁ A[p] under ω_{A[p]} = ω_A/p. On a split torus 𝔾_m^g, V* is an isomorphism and Ha is a unit; on a degeneration chart Ha(G) = Ha(B) ⊗ (unit of the torus part) through det ω_G ≅ det ω_T ⊗ det ω_B.

**Hypotheses.**

- Ownership (RT-AREA-padic-1/26): the Hasse invariant Ha(G) = det V* of a BT₁ over any 𝔽_p-scheme, Fargues's isomorphism LF and the BT₁ Hodge–Tate sequence are FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2's; this node owns only the semi-abelian and boundary extension and its comparison with R07.2.
- S of characteristic p; semi-abelian schemes and their degeneration data from ShimuraCompactifications C4.
- A general semi-abelian scheme has no dual semi-abelian scheme of the same kind. The existence and base-change compatibility of V over an arbitrary F_p-base, including degeneration charts, is a separate supplier request and gap.

**Proof route.**

- On the abelian locus, V is the dual of the Frobenius of the dual abelian scheme (AbelianSchemesAndArithmeticModuli A2/A3) and V* on ω_A agrees with V* on ω_{A[p]} = ω_A/p (R07.2).
- On a chart, the Raynaud extension 0 → T → G̃ → B → 0 gives 0 → ω_B → ω_G̃ → ω_T → 0; V is compatible with it, and on a split torus V is the identity of 𝔾_m^g after Frobenius twist, so its determinant on ω_T is a unit.
- Glue: the two descriptions agree on overlaps because both are det V* on ω_G (C4/homomorphism-extension).

**Acceptance instances.**

- For an ordinary elliptic curve Ha is a unit, for a supersingular one Ha = 0.
- For the Tate curve, Ha = 1 in the q-expansion normalisation.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/conormal-module`
- `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-torsion`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/frobenius-verschiebung`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`
- `ShimuraCompactifications:C4/semi-abelian-scheme`
- `ShimuraCompactifications:C4/homomorphism-extension`
- `AbelianSchemesAndArithmeticModuli:A2`
- `mathlib:LinearMap.det`
- `mathlib:Module.Invertible`
- `ShimuraCompactifications:C4`

**Source matches.**

- SCH15, §3.2.1, before Lemma 3.2.5, p. 33 (arXiv v2): Scholze's definition of Ha(A/S) from Verschiebung.
- SCH15, §3.2.1, before Lemma 3.2.5, p. 33 (arXiv v2): The name and the section of ω^{⊗(p−1)}.

**Uses.**

- Scholze 2015, §3.2: Hasse domains 𝒳(ε) = {|Ha| ≥ |p|^ε} and canonical subgroups
- ShimuraCompactifications:C6/hilbert-hasse-boundary-comparison: Hilbert Hasse ideal at the boundary (split-torus Verschiebung determinant a unit)
- PerfectoidShimuraVarieties:S1/siegel-finite-level-spaces: Siegel Hasse domains
- HodgeTateAndCanonicalSubgroups:T3: the Hasse neighbourhoods on which canonical subgroups exist

**Planning API.**

- `TauCeti.HodgeTate.semiAbelianHasse` (constructor): Ha(G/S) = det V* ∈ H⁰(S, (det ω_G)^{⊗(p−1)}).
- `TauCeti.HodgeTate.semiAbelianHasse_eq_bt1Hasse` (compatibility): For G = A abelian, Ha(A/S) = Ha(A[p]) of R07.2 under ω_{A[p]} = ω_A/p.
- `TauCeti.HodgeTate.semiAbelianHasse_baseChange` (functoriality): Ha commutes with base change S′ → S.
- `TauCeti.HodgeTate.semiAbelianHasse_torus` (compatibility): On a split torus Ha is a unit (det V* is an isomorphism on ω_T).
- `TauCeti.HodgeTate.semiAbelianHasse_raynaud` (relation): On a degeneration chart, Ha(G) = Ha(B)·u with u a unit, through det ω_G ≅ det ω_T ⊗ det ω_B.
- `TauCeti.HodgeTate.semiAbelianHasse_isUnit_iff` (characterisation): Ha(G/S) is a unit iff every geometric fibre is ordinary (T0/hasse-invariant-ordinary-locus).

**Mathematical tests.**

- `TauCeti.HodgeTate.semiAbelianHasse_tateCurve` (computation): For the Tate curve over 𝔽_p((q)), Ha = 1 with respect to the canonical differential dt/t.
- `TauCeti.HodgeTate.semiAbelianHasse_torus_test` (degenerate): For G = 𝔾_m^g over S, Ha(G/S) is a unit.
- `TauCeti.HodgeTate.semiAbelianHasse_supersingular` (non-example): For a supersingular elliptic curve over 𝔽̄_p, Ha = 0: Ha is not a unit on every fibre, and Ha does not detect supersingularity only through the order of E[p](𝔽̄_p) without V.
- `TauCeti.HodgeTate.semiAbelianHasse_bt1` (compatibility): For A abelian, Ha(A/S) equals R07.2's Ha(A[p]).

### T0/hasse-invariant-ordinary-locus — The Hasse invariant is invertible exactly on the ordinary locus

**Theorem** · proposed name `TauCeti.HodgeTate.hasseInvariant_ordinaryLocus` · implementation unchecked.

Let S be an 𝔽_p-scheme and A → S an abelian scheme of dimension g. Then Ha(A/S) is invertible if and only if A is ordinary, i.e. for every geometric point x̄ of S, A[p](x̄) has p^g elements. For a semi-abelian G with abelian part B on a stratum, Ha(G/S) is invertible at x̄ iff B_x̄ is ordinary.

**Hypotheses.**

- S of characteristic p.

**Proof route.**

- Ha invertible ⇔ V: A^{(p)} → A is an isomorphism on tangent spaces ⇔ V is finite étale ⇔ ker V has p^g geometric points over every x̄ (deg V = p^g).
- Since VF = p and F is purely inseparable, A[p](x̄) = (ker V)(x̄).
- The semi-abelian statement follows from T0/semi-abelian-hasse-invariant (Ha(G) = Ha(B)·unit).

**Acceptance instances.**

- The Tate curve is ordinary: Ha is a unit near the cusp.
- A supersingular elliptic curve has Ha = 0.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-hasse-invariant`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/frobenius-verschiebung`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`

**Source matches.**

- SCH15, §3.2.1, Lemma 3.2.5, p. 33 (arXiv v2): Lemma 3.2.5: invertible iff ordinary.
- SCH15, §3.2.1, proof of Lemma 3.2.5, p. 33: The key step of the proof.

### T0/hasse-invariant-minimal-compactification — The Hasse invariant on toroidal and minimal compactifications

**Theorem** · proposed name `TauCeti.HodgeTate.hasseInvariant_minimalCompactification` · implementation unchecked.

For a neat prime-to-p Siegel moduli scheme X/ℤ_(p) and its normal toroidal and minimal compactifications, the section Ha of (det ω)^{⊗(p−1)} on X_{𝔽_p} extends by semi-abelian Verschiebung to the toroidal space and descends to the minimal space. Descent uses the descended determinant Hodge line and the structure-sheaf pushforward over the special fibre. At a boundary stratum, after the torus determinant trivialization, the value is Ha of the abelian part; toric directions contribute a unit. For g=1 it takes value 1 in the Tate-cusp normalization. The HBAV version imports its separate C6 boundary model; a GSp₄/F version requires the exact C5 PEL model and pushforward theorem.

**Hypotheses.**

- The toroidal and minimal models, the descended Hodge line and special-fibre pushforward are from C5, with its prime and fan restrictions.
- A boundary with positive-dimensional abelian part need not be ordinary; only the torus factor has unit Hasse invariant.

**Proof route.**

- Apply semiAbelianHasse on the universal semi-abelian toroidal scheme.
- Use π_*O_{X^tor,𝔽_p}=O_{X*,𝔽_p} and projection formula for the descended Hodge line; this proves special-fibre descent directly, without a blanket normality/Hartogs assertion on every normalized model.
- Use the Raynaud determinant formula at the boundary and the Tate-cusp computation.

**Acceptance instances.**

- For g = 1, Ha extends to the cusps with value 1 (the Tate curve is ordinary).
- Ha is a section of an ample line bundle on X*_{𝔽_p}, so its non-vanishing locus is affine.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-hasse-invariant`
- `HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-ordinary-locus`
- `ShimuraCompactifications:C5/integral-toroidal-space`
- `ShimuraCompactifications:C5/integral-minimal-space`
- `ShimuraCompactifications:C5/minimal-hodge-ampleness`

**Source matches.**

- SCH15, §III.2.2, PDF pp. 37–39; Lemma III.3.2, PDF p. 54: The compactified Hasse section and its value in the abelian part of a boundary degeneration.

### T0/hodge-tate-boundary-extension — The finite-level Hodge–Tate map over the toroidal boundary

**Theorem** · proposed name `TauCeti.HodgeTate.hodgeTate_boundaryExtension` · implementation unchecked.

On the normal full-level-p^n toroidal Siegel model, the finite-level character-differential map extends as a morphism (ℤ/p^n)^{2g}⊗O→ω_G/p^n. On each cusp chart it is computed using the polarized one-motive [Y→G̃]; the toric character piece vanishes and the abelian character differential descends from the base of the torus bundle. The lattice piece is handled by the dual one-motive pairing. The chart maps agree integrally modulo p^n by their functorial one-motive description and cone refinements. For GSp₄/F the same target is conditional on the precise C4 degeneration model and C5 normalized-Koecher coefficient theorem; E27 is a rejected source-error allegation, not evidence that Lan’s theorem is false.

**Hypotheses.**

- Only use normal full-level charts on which C4 supplies the polarized one-motive, pairing, torsion and overlap morphisms, including its good-prime hypotheses.
- Lan’s theorem must be applied to its actual normalized model, formally canonical ω/p^n coefficient, O⊗ℚ simple hypothesis and dimension-one boundary exception.

**Proof route.**

- Use PS16 Proposition 1.5: the map on G̃^D[p^n] factors through the abelian part, vanishes on the torus character piece, and descends from the torus-bundle base.
- Apply the one-motive pairing to the lattice part and extend along the cone charts; naturality under chart overlap and fan refinement gives gluing modulo p^n.
- For the GSp₄/F route import the checked normalized Koecher coefficient theorem from C5. Equality on a dense characteristic-zero open alone would not prove equality modulo p^n.

**Acceptance instances.**

- For the modular curve at level Γ(p^n), HT at the cusp ∞ vanishes on μ_{p^n} ⊂ E_q[p^n] and sends a point lifting the generator q^{1/p^n} of the quotient ℤ/p^n to dt/t, a generator of ω/p^n (Pilloni–Stroh: the map is trivial on the toric part).

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-torsion`
- `HodgeTateAndCanonicalSubgroups:T0/finite-hodge-tate-map`
- `HodgeTateAndCanonicalSubgroups:T0/multiplicative-hodge-tate-isomorphism`
- `ShimuraCompactifications:C5/higher-level-toroidal-normalization`
- `ShimuraCompactifications:C5/normalized-koecher`
- `ShimuraCompactifications:C4/formal-universal-degeneration`
- `ShimuraCompactifications:C4`
- `HodgeTateAndCanonicalSubgroups:T0/finite-hodge-tate-naturality`
- `ShimuraCompactifications:C5`

**Source matches.**

- PS16, §1.3, Proposition 1.5 and Remark 1.6, PDF pp. 4–5: Constructs the integral boundary character map on polarized one-motive charts.
- BCGP21, §6.1.4, PDF p. 141: Uses normalized Koecher for the GSp₄/F finite-level map; exact supplier hypotheses remain explicit.

### T0/raynaud-hodge-tate-filtration — The Hodge–Tate filtration of an abelian variety through its Raynaud extension

**Theorem** · proposed name `TauCeti.HodgeTate.raynaudHodgeTate_filtration` · implementation unchecked.

Let C/ℚ_p be complete algebraically closed and A/C abelian. Given the R11.3 semistable descent/uniformization data over O_C, write A^an=G̃^an/Y with 0→T→G̃→B→0, torus rank r and dim B=g−r. The finite-height p-divisible group G̃[p∞] has height 2g−r and dimension g, and 0→T_pG̃→T_pA→Y⊗ℤ_p→0 is exact. The integral Faltings inclusion Lie(G̃)(1)⊗C→T_pG̃⊗C identifies with the Hodge–Tate filtration Lie(A)(1)⊗C⊂T_pA⊗C; it contains T_pT⊗C. Applying the dual one-motive gives the quotient T_pA^∨⊗C→ω_A, including its toric-form lattice quotient. For an A descending to a discretely valued K, all maps are compatible with the descent/Galois action.

**Hypotheses.**

- R11.3’s complete-DVR theorem alone is insufficient for an arbitrary C-variety; require either its explicit O_C theorem or effective descent to an admissible semistable model.
- Use the dual Raynaud one-motive to compute the quotient; there is no dual semi-abelian scheme of the same kind by assumption.

**Proof route.**

- Import semistable existence plus the O_C uniformization and its dual one-motive from R11.3; form the Tate extension.
- Identify the finite-height Faltings inclusion with the analytic Hodge–Tate inclusion through the compatible differential/one-motive comparison of the supplier and SCH15 Proposition III.3.1.
- Compute the torus inclusion and the lattice graded quotient through the polarized pairing; the dimensions g,2g−r,2g verify the stated filtration.

**Acceptance instances.**

- For a Tate curve E_q, the Hodge–Tate filtration is ℤ_p(1) ⊗ C = T_pμ_{p^∞} ⊗ C ⊂ T_pE_q ⊗ C, the line spanned by the μ_{p^∞}-part.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/p-divisible-hodge-tate-map`
- `HodgeTateAndCanonicalSubgroups:T0/hodge-tate-map-compatibilities`
- `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-torsion`
- `NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison`
- `NeronModelsAndSemistableAbelianVarieties:R11.3/rigid-uniformisation`
- `NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction`
- `NeronModelsAndSemistableAbelianVarieties:R11.3`

**Source matches.**

- SCH15, §3.3, Proposition 3.3.1 (arXiv v2, III.3.1), PDF p. 54: Proposition 3.3.1.

### T0/harder-narasimhan-filtration — The Harder–Narasimhan filtration of a finite flat group scheme

**Definition** · proposed name `TauCeti.HodgeTate.harderNarasimhanFiltration` · implementation unchecked.

Let K, v be as in T0/fargues-degree and G ≠ 0 a finite flat commutative group scheme of p-power order over O_K; 'subgroup' means closed finite flat subgroup scheme. G is semi-stable if μ(G′) ≤ μ(G) for every nonzero subgroup G′. Every such G has a unique filtration 0 = G₀ ⊊ G₁ ⊊ … ⊊ G_k = G by subgroups with G_{i+1}/G_i semi-stable and μ(G_i/G_{i−1}) > μ(G_{i+1}/G_i); its Harder–Narasimhan polygon HN(G) is the concave polygon from (0, 0) to (ht G, deg G) with slopes μ(G_i/G_{i−1}) of multiplicity ht(G_i/G_{i−1}). For every subgroup G′, deg G′ ≤ HN(G)(ht G′), and HN(G) is the concave envelope of the points (ht G′, deg G′). The filtration is Aut(G)-stable, compatible with valued extensions (K henselian), its slope-1 step is the multiplicative part and its slope-0 quotient the étale part, and Cartier duality exchanges the filtration of G^D with the orthogonals of the steps of G, slopes λ ↦ 1 − λ.

**Hypotheses.**

- Slopes and degrees from T0/fargues-degree; the existence proof is the formal Harder–Narasimhan argument in an exact category with a degree function that increases along generic isomorphisms (T0/fargues-degree-generic-isomorphism).

**Proof route.**

- Show that every G not semi-stable has a unique semi-stable subgroup of maximal slope and maximal height among those (Fargues 2010, Proposition 4), using Corollaire 5 (slopes in exact sequences and along generic isomorphisms).
- Induct on the height to build the filtration (Théorème 2), exactly as for vector bundles; uniqueness from the uniqueness of the maximal destabilising subgroup.
- Polygon properties (Proposition 7), functoriality (Remark 1), duality (Lemme 9, Corollaire 8) and Galois descent (Proposition 6).

**Acceptance instances.**

- For G ordinary BT_n (μ_{p^n}^d × (ℤ/p^n)^{h−d}) the filtration is 0 ⊂ G^0 ⊂ G with slopes 1, 0.
- Fargues 2011: for a BT_n with small Hasse invariant the canonical subgroup is a step of the filtration (T3/canonical-subgroup-theorem (2)).

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree-properties`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree-generic-isomorphism`

**Source matches.**

- FAR10, §4.6, Théorème 2, PDF p. 13: Existence and uniqueness of the HN filtration.
- FAR10, §4.9, Définition 9, PDF p. 14: The HN polygon.
- FAR10, §4.9, Proposition 7, PDF p. 14: Degrees of subgroups lie under the polygon.

**Uses.**

- Fargues 2011, §§7–8: the canonical subgroup is a Harder–Narasimhan step
- Bijakowski–Pilloni–Stroh 2016; Pilloni 2020 §14: degree functions and HN polygons on Siegel varieties

**Planning API.**

- `TauCeti.HodgeTate.farguesSlope_le_of_semistable` (characterisation): G is semi-stable iff μ(G′) ≤ μ(G) for all nonzero subgroups G′, iff μ(G) ≤ μ(G/G′) for all proper nonzero G′.
- `TauCeti.HodgeTate.harderNarasimhanFiltration` (constructor): The unique filtration with semi-stable graded pieces of strictly decreasing slopes.
- `TauCeti.HodgeTate.harderNarasimhanPolygon` (constructor): HN(G): the concave polygon of the filtration.
- `TauCeti.HodgeTate.degree_le_harderNarasimhanPolygon` (relation): deg G′ ≤ HN(G)(ht G′) for every subgroup G′.
- `TauCeti.HodgeTate.harderNarasimhanFiltration_dual` (relation): The filtration of G^D is formed by the Cartier duals of the quotients G/G_i, with slopes 1 − μ_i.
- `TauCeti.HodgeTate.harderNarasimhanFiltration_aut` (functoriality): Every automorphism of G preserves the filtration; it commutes with valued field extensions.

**Mathematical tests.**

- `TauCeti.HodgeTate.harderNarasimhanFiltration_ordinary` (computation): For G = μ_p × ℤ/p over O_K the filtration is 0 ⊂ μ_p ⊂ G with slopes 1 and 0.
- `TauCeti.HodgeTate.harderNarasimhanFiltration_semistable` (degenerate): If G is semi-stable (e.g. G = E[p] for E supersingular with Ha(E) ≥ p/(p+1)) the filtration is 0 ⊂ G.
- `TauCeti.HodgeTate.harderNarasimhanFiltration_not_connectedEtale` (non-example): The HN filtration is not the connected–étale filtration: for E with Ha(E) < p/(p+1) the first step is the canonical subgroup, which is neither connected-étale nor multiplicative in general (deg C ∈ (0, 1)).

### T0/degree-different — The discriminant divisor is the different of the group algebra

**Lemma** · proposed name `TauCeti.HodgeTate.degree_different` · implementation unchecked.

Let A be a ring, t a regular element, and B a finite syntomic A-algebra étale over A[1/t]. Its trace codifferent D^{-1}_{B/A} is an invertible fractional B-ideal, and its inverse D_{B/A} is Fitt₀^B Ω¹_{B/A} (Fargues Proposition 1 calls this ideal Δ_{B/A}). The discriminant of the trace pairing over A is its norm, rather than this B-ideal itself. For a finite locally free commutative generically étale group G = Spec B over S = Spec A, D_{G/S} = f*δ_G, where δ_G = Fitt₀^A ω_G. Thus e*D^{-1}_{G/S} = δ_G^{-1} as an invertible fractional A-module; it is not ω_G. In the monogenic valuation-ring case B = O_K[T]/(f), f(0) = 0, ω_G = O_K/(f′(0)) and deg G = v(f′(0)) = Σ_{x≠0}v(x), counting all geometric roots.

**Hypotheses.**

- B syntomic over A (finite flat group schemes over a valuation ring are), t regular.
- Counterexample distinguishing the objects: ω_{μ_p} = A/pA is torsion, whereas e*D^{-1}_{μ_p/A} = p^{−1}A is an invertible fractional module when p is regular.

**Proof route.**

- Grothendieck duality for Spec B ↪ Y smooth over S: f^!O_S = det L_{B/A}, and the trace identifies Hom_A(B, A) with Γ(det L); the section defining Δ maps to tr_{B/A} (Fargues 2010, Proposition 1).
- For a group scheme, translation invariance gives Ω¹_{G/S} = f*ω_G, so Fitt₀ Ω¹ = f*Fitt₀ ω_G = f*δ_G (Fargues 2010, §2).
- Monogenic case: ω_G = O_K/f′(0) and f′(0) = ∏_{x ≠ 0} (−x) up to a unit.

**Acceptance instances.**

- For μ_p over a p-torsion-free valuation ring, ω_{μ_p}=R/pR while e*D^{−1}=p^{−1}R; they are not isomorphic R-modules.
- For f(T)=(1+T)^p−1, f′(0)=p and Σ_{i=1}^{p−1}v(ζ_p^i−1)=1. The discriminant over R is the norm of the B-different.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree`
- `mathlib:KaehlerDifferential`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`

**Source matches.**

- FAR10, §1.3–1.4, Proposition 1, PDF pp. 4–6; §2, PDF p. 7: Trace duality identifies the inverse different as an invertible fractional ideal and translation identifies the group different with the pullback of Fitt₀ω.

### T0/conormal-base-change — Base change of invariant differentials

**Lemma** · proposed name `TauCeti.HodgeTate.conormal_baseChange` · implementation unchecked.

For H/S finite locally free commutative and any S′→S, ω_H⊗O_{S′}≅ω_{H_{S′}} canonically, with identity/composition coherence.

**Hypotheses.**

- Relative Kähler differentials and pullback are the shared sheaf operations.

**Proof route.**

- Apply base change for Ω¹_{H/S}, then pull back along the base-changed unit; coherence is the pullback coherence.

**Acceptance instances.**

- For Spec R the map agrees with base change of the augmentation cotangent module.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/conormal-module`
- `mathlib:AlgebraicGeometry.Scheme.Modules`
- `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`

**Source matches.**

- FAR11, §2.1.1, PDF p. 4: The character map is computed in invariant differentials and behaves under extension of the base.

### T0/conormal-right-exact — Invariant differentials of an exact group sequence

**Lemma** · proposed name `TauCeti.HodgeTate.conormal_rightExact` · implementation unchecked.

For an fppf-exact sequence 0→H′→H→H″→0 of finite locally free commutative groups over S, ω_{H″}→ω_H→ω_{H′}→0 is right exact.

**Hypotheses.**

- All three groups are finite locally free; no left injectivity is asserted.

**Proof route.**

- Apply the cotangent transitivity/right-exact differential sequence to the quotient and pull back at the identity; use fppf descent.

**Acceptance instances.**

- The μ_p example has a torsion conormal; right exactness does not imply a vector-bundle short exact sequence.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/conormal-module`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`
- `mathlib:AlgebraicGeometry.Scheme.Modules`
- `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`

**Source matches.**

- FAR10, §2, PDF pp. 6–8: Uses the co-Lie triangle and invariant differentials for finite-flat exact sequences.

### T0/finite-hodge-tate-naturality — Naturality of the character differential

**Lemma** · proposed name `TauCeti.HodgeTate.hodgeTateMap_natural` · implementation unchecked.

For f:H→K of finite locally free commutative S-groups and x∈H(S), α_K(f(x))=(f^D)*α_H(x); this identity commutes with base change.

**Hypotheses.**

- Use the existing Cartier duality and conormal base-change isomorphism.

**Proof route.**

- The character of f(x) is the composite of f^D with the character of x. Pullback of dt/t composes.

**Acceptance instances.**

- For [p], both sides are p times the character differential.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/finite-hodge-tate-map`
- `HodgeTateAndCanonicalSubgroups:T0/conormal-base-change`

**Source matches.**

- FAR11, §2.1.1, PDF p. 4: Character differentials give the functorial finite-level Hodge–Tate map.

**Coverage: planned.**

- Group co-Lie deformation and trace duality: R07.6 owns the finite-flat group specialization of DD.0’s full cotangent and obstruction theory, syntomic determinant and trace duality. Read FAR10 §1–§2, SCH15 III.2.2 and HALO A.1 give the consequences used here; Illusie II is not cleared and its foundation is not independently verified. The Fitting definition of degree does not remove this lifting input.
- Valuation-ring Fitting and the integral O_C Faltings complex: Import the StableReduction general Fitting direction, and request its nonnoetherian finite-presentation valuation specialization from R07.1. CDM12 Theorem 4.13 independently supplies the bounded integral complex and zero composite; R07.1’s existing complete-noetherian-local dimension statements do not cover O_C, and its finite-to-p-divisible embedding must have exact hypotheses.
- Boundary one-motives and arbitrary-C Raynaud realization: C4 supplies polarized [Y→G̃], the finite-flat torsion pieces and integral overlap uniqueness, plus arbitrary-base semi-abelian Verschiebung. R11.3 supplies the descent/existence or complete-C uniformization extension beyond its current DVR statements. Boundary coordinate estimates use the full height-2g dual one-motive realization, not the smaller finite Raynaud group.
- Normalized PEL model, coefficient and determinant descent: The E27 source-error allegation remains rejected. Lan Definition 8.5/Theorem 8.7, read with the author’s errata, cover normalized ramified models and nonflat coefficient algebras under their stated assumptions. C5 must identify the exact GSp₄/F model and formally canonical coefficient, verify the dimension exception, and separately supply the mod-p^k pushforward/projection formula and determinant/norm descent. C6 HBAV models do not discharge this request.

## T1 — Relative comparison is narrowed to the stated K/algebraizability setting. The character-map and rational tensor compatibilities are explicit contracts rather than density arguments.

### T1/abelian-relative-comparison — The relative de Rham comparison for abelian schemes

**Comparison** · proposed name `TauCeti.HodgeTate.abelianRelativeComparison` · implementation unchecked.

Let K/ℚ_p be complete discretely valued with perfect residue field, X/K a smooth adic space, and f:A→X the analytification of an algebraic abelian scheme. On X_proét, let V=R¹f_*ℚ_p and H=H¹_dR(A/X), with its Hodge filtration and Gauss–Manin connection. P8’s proper-smooth theorem gives a canonical filtered horizontal isomorphism V⊗OB_dR≅H⊗OB_dR, natural in A and compatible with tensor products, duals and cup/Weil pairings with their Tate twists. The abelian Hodge–Tate filtration is formed from M=V⊗B_dR^+ and M₀=(H⊗OB_dR^+)^{∇=0}, embedded in their common B_dR module; it is not obtained by replacing gr⁰OB_dR with Ô_X. On geometric points V≅Hom(T_pA,ℚ_p)≅V_pA^∨(−1). The homology cyclotomic summand has weight +1 and the cohomology twist is −1.

**Hypotheses.**

- The local-system finiteness hypothesis of CS17 Theorem 2.2.2 is satisfied by the algebraizable proper-smooth family. General smooth adic morphisms need the finiteness hypothesis explicitly.
- P8 owns period sheaves, horizontal comparison and its relative Poincaré lemma. This is their degree-one abelian specialization.

**Proof route.**

- Apply CS17 Theorem 2.2.2/P8 in degree one; use A4’s Hodge filtration and Gauss–Manin connection.
- Identify homology and cohomology through A3’s Weil pairing, tracking the −1 twist rather than treating T_pA and R¹f_*ℚ_p as the same local system.
- Use P8’s multiplicativity and duality to obtain the tensor and polarization comparisons; construct M and M₀ through horizontal sections as in CS17 §2.2.

**Acceptance instances.**

- For X a point and A = E an elliptic curve over K, the comparison reduces to the de Rham comparison of V_pE (PadicHodgeTheory R06.5/abelian-variety-hodge-tate-weights).

**Inputs.**

- `PadicHodgeTheory:P8`
- `PadicHodgeTheory:R06.5/abelian-variety-hodge-tate-weights`
- `CohomologyComparisons:CP.0/twist-frobenius-filtration-normalization`
- `ClassicalAdicEtaleCohomology:H0/tate-twists`
- `AbelianSchemesAndArithmeticModuli:A4`
- `AdicEtaleGeometry:A1/pro-etale-site-corrected`
- `PerfectoidSpaces:P0/almost-basic-setup`

**Source matches.**

- CS17, §2.2, Theorem 2.2.2 and Proposition 2.2.3, PDF pp. 13–15: The structural comparison and the two horizontal B_dR^+ lattices have different roles.

### T1/hodge-tate-graded-comparison — The graded comparison is the Hodge–Tate map of T0

**Comparison** · proposed name `TauCeti.HodgeTate.hodgeTateGradedComparison` · implementation unchecked.

In the degree-one abelian comparison, define the ascending cohomological Hodge–Tate filtration on gr⁰M=V⊗Ô_X by F_{−j}=(M∩t^jM₀)/(tM∩t^jM₀). CS17 Corollary 2.2.4 identifies gr^j_HT(V⊗Ô_X) with gr^j_Hodge(H)⊗Ô_X(−j). Dualizing and applying the Weil pairing gives the quotient T_pA^∨⊗Ô_X→ω_A⊗Ô_X. For good reduction at a geometric point this quotient equals the C-linearization of T0’s character differential, by CDM12 Proposition 4.15; general reduction uses the dual Raynaud one-motive comparison. The family identification uses P8’s compatible relative character/Kummer map, not analytic density of ordinary points.

**Hypotheses.**

- M,M₀ and their common B_dR realization are those of T1/abelian-relative-comparison; gr⁰B_dR=Ô_X, while gr⁰OB_dR is not replaced by Ô_X.
- The good-reduction character comparison is explicitly sourced; the relative and semistable identifications have their own supplier contracts.

**Proof route.**

- Use CS17 Proposition 2.2.3 to compute intersections of the two lattices; passing to graded modules gives Corollary 2.2.4.
- CS17 Proposition 2.2.5 identifies the first step with the natural cohomological edge map.
- For good reduction, CDM12 Proposition 4.15 compares that edge map to the Faltings character map: Weil duality reduces to the Kummer class of 1+T on the formal unit ball and its logarithmic differential.
- For families import the natural relative Kummer/character identification from P8; for semistable points import R11.3’s compatible dual one-motive construction.

**Acceptance instances.**

- For the Tate curve both maps send the class corresponding to μ_{p^∞} to 0 and the class of ℚ_p/ℤ_p to dt/t.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T1/abelian-relative-comparison`
- `HodgeTateAndCanonicalSubgroups:T0/p-divisible-hodge-tate-map`
- `HodgeTateAndCanonicalSubgroups:T0/hodge-tate-map-compatibilities`
- `HodgeTateAndCanonicalSubgroups:T0/raynaud-hodge-tate-filtration`
- `PadicHodgeTheory:P8`

**Source matches.**

- CS17, §2.2, Proposition 2.2.3, Corollary 2.2.4 and Proposition 2.2.5, PDF pp. 14–16; Remark 4.2.8, PDF p. 47: Defines the relative filtration using two lattices and compares its pointwise abelian map with the character construction.
- CDM12, Theorem 4.13, Remark 4.14 and Proposition 4.15 and Remark 4.14, PDF pp. 27–29: Proves the good-reduction agreement through the Kummer/logarithmic character calculation.

### T1/hodge-tensor-comparison — Hodge tensors under the p-adic comparison

**Theorem** · proposed name `TauCeti.HodgeTate.hodgeTensorComparison` · planet **Hodge tensors under the p-adic comparison** · implementation unchecked.

Let (G, X) be a Shimura datum of Hodge type with a symplectic embedding G ↪ GSp(V) and tensors (s_α) ⊂ V^⊗ cutting out G, and A → Sh_K the induced abelian scheme. The tensors s_α define absolute Hodge cycles s_{α,dR} ∈ ℋ^⊗ and s_{α,ét} ∈ (V_pA)^⊗ (using homology, the dual of R¹f_*ℚ_p) (AutomorphicBundles B1), and under the relative comparison of T1/abelian-relative-comparison, s_{α,ét} ⊗ 1 ↦ s_{α,dR} ⊗ 1. Consequently the comparison isomorphism and its Hodge–Tate graded piece are compatible with the G-structures, and the resulting rational frame torsors are G_{ℚ_p}-torsors.

**Hypotheses.**

- The input that the tensors are absolute Hodge (Deligne) and that p-adic comparisons respect absolute Hodge cycles (Blasius, Wintenberger) is a proved dependency supplied by AutomorphicBundles B1/absolute-hodge-propagation, not an assumption of the Hodge conjecture.
- The tensors and frame torsor are rational. Integral tensors or a reductive G_{ℤ_p}-model require a chosen stable lattice and additional hypotheses; they do not follow for arbitrary Hodge-type level K.

**Proof route.**

- Blasius: for an abelian variety over a number field the de Rham comparison maps the étale components of absolute Hodge cycles to the de Rham components.
- Use AutomorphicBundles B1/absolute-hodge-propagation and CS17 §2.3: equality is horizontal, so compare at a classical point on each connected component. This supplies the rational tensor assertion, not integrality of its étale realisations.

**Acceptance instances.**

- For G = GSp(V) the only tensor is the symplectic form, and the statement is the compatibility of the comparison with the Weil pairing.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T1/abelian-relative-comparison`
- `AutomorphicBundles:B1/absolute-hodge-propagation`
- `AutomorphicBundles:B1/hodge-tensor-realizations`
- `AutomorphicBundles:B1`

**Source matches.**

- CS17, §2.3, after Lemma 2.3.6 (arXiv:1511.02418v1), PDF p. 20: Caraiani–Scholze §2.2: Blasius's theorem on Hodge tensors under the comparison.

**Coverage: planned.**

- Relative character comparison and Tate-normalized rational tensors: P8 supplies the two horizontal B_dR^+ lattices and relative Kummer edge-map compatibility of CS17 §2.2; CDM12 Proposition 4.15 is the independently read good-reduction pointwise reference. B1 supplies rational defining tensors and central-μ contraction with the Tate-basis torsor. CS17’s raw untwisted conclusion is corrected by Boxer–Pilloni §4.4.8/Remark 4.4.23 (E31). General-C families outside the stated K-descent hypothesis and integral G_ℤp frames require separate extensions. P8 also supplies the absolute arbitrary-C algebraic degree-one spectral sequence and A4 its H¹O/invariant-differential identifications; this does not assume finite-Q_p descent.

## T2 — Rational exact sequences, tensor flags, the cyclotomic Levi comparison and the open limit-tower period map. S3 supplies the perfectoid incarnation and compactified extension.

### T2/p-divisible-hodge-tate-sequence — The Hodge–Tate exact sequence of a p-divisible group over O_C

**Theorem** · proposed name `TauCeti.HodgeTate.pDivisibleHodgeTateSequence` · planet **Hodge–Tate exact sequence** · implementation unchecked.

Let C be a complete algebraically closed extension of ℚ_p and G a p-divisible group over O_C of height h and dimension d, with Cartier dual G^D. Then the sequence 0 → Lie(G) ⊗_{O_C} C(1) → T_pG ⊗_{ℤ_p} C → ω_{G^D} ⊗_{O_C} C → 0 is exact, where the second map is α_G ⊗ C (T0/p-divisible-hodge-tate-map) and the first is the C-linearisation of the dual map α_{G^D}^∨ twisted by ℤ_p(1) through the Cartier pairing T_pG × T_pG^D → ℤ_p(1). Integrally, α_G ⊗ 1: T_pG ⊗ O_C → ω_{G^D} has cokernel killed by p^{1/(p−1)} (T0/fargues-hodge-tate-cokernel) and the composite of the two maps is zero.

**Hypotheses.**

- G is over O_C with the finite free conormal/dimension and integral Faltings complex supplied by the O_C extension of R07.1.
- The zero composite and integral annihilator estimates are inputs independent of dimension counts.

**Proof route.**

- Use T0/fargues-hodge-tate-cokernel for the actual integral complex and its zero composite (CDM12 Theorem 4.13).
- After inversion of p, the character map is surjective; apply the same bound to G^D and dualize via the Cartier Tate pairing to see that the first map is injective.
- Use dim Lie G=d, dim ω_GD=h−d and rank T_pG=h from the O_C supplier to identify image and kernel. The resulting sequence is natural and twisted by C(1) on the Lie term.

**Acceptance instances.**

- For G = μ_{p^∞}: 0 → C(1) → C(1) → 0 → 0; for G = ℚ_p/ℤ_p: 0 → 0 → C → C → 0.
- For G = E[p^∞] with E elliptic over O_C, both outer terms are one-dimensional.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/p-divisible-hodge-tate-map`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-hodge-tate-cokernel`
- `HodgeTateAndCanonicalSubgroups:T0/hodge-tate-map-compatibilities`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/dimension-plus-dual-dimension`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-tate-module`
- `ClassicalAdicEtaleCohomology:H0/tate-twists`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`

**Source matches.**

- CDM12, Theorem 4.13, PDF pp. 27–28: The bounded integral complex becomes an exact Hodge–Tate sequence after inverting p.
- SW13, §4.3, Proposition 4.3.6, PDF p.39 (arXiv:1211.6357v2): Uses the canonical Hodge–Tate exact sequence in the O_C classification setting.

### T2/abelian-hodge-tate-sequence — The Hodge–Tate sequence of an abelian variety

**Theorem** · proposed name `TauCeti.HodgeTate.abelianHodgeTateSequence` · planet **Hodge–Tate sequence of an abelian variety** · implementation unchecked.

Let C be a complete algebraically closed extension of ℚ_p and A an abelian variety over C of dimension g. There is a canonical exact sequence 0 → Lie(A^∨)(1) → T_pA^∨ ⊗_{ℤ_p} C → ω_A → 0 (the roadmap's convention, with Lie(A^∨)(1) := Lie(A^∨) ⊗ C(1)), functorial in A, compatible with isogenies, with endomorphisms and with polarisations; for A defined over a complete discretely valued K ⊂ C it is Gal(C/K)-equivariant. Dually, the Hodge–Tate filtration Lie A ⊗ C(1) ⊂ T_pA ⊗ C is a Lagrangian subspace for the Weil pairing of any principal polarisation. For A with good reduction it is the sequence of T2/p-divisible-hodge-tate-sequence for G = A^∨[p^∞]; over arbitrary C its rational sequence comes from degree-one cohomological Hodge–Tate theory; its Raynaud character interpretation is conditional on T0/raynaud-hodge-tate-filtration.

**Hypotheses.**

- No good reduction is required for the rational analytic abelian sequence. The semistable character interpretation is conditional on the explicit O_C Raynaud supplier.
- For A/K, a Galois-equivariant filtration is asserted; no canonical Galois-equivariant splitting is claimed.

**Proof route.**

- Apply the proper smooth algebraic Hodge–Tate spectral sequence over the given arbitrary complete algebraically closed C (CDM12 Theorem 3.20 and Remark 3.21, PDF p.20). In degree one its degeneration gives 0→H¹(A,𝒪_A)⊗C→H¹_ét(A,ℚ_p)⊗C→H⁰(A,Ω¹_A)⊗C(−1)→0.
- Use A4’s H¹(A,𝒪_A)=Lie(A^∨), H⁰(A,Ω¹_A)=ω_A and A3’s Weil duality H¹_ét(A,ℚ_p)(1)=V_pA^∨ to obtain the stated homological quotient sequence. No descent of A to a finite extension of ℚ_p is required.
- For good reduction identify the character map by CDM12 Proposition 4.15; the semistable character description uses the separate conditional O_C Raynaud input. Functoriality of the spectral sequence and the Weil pairing give endomorphisms, duality and isotropy; half dimension makes the Lie subspace Lagrangian.

**Acceptance instances.**

- For E elliptic with ordinary reduction, the filtration is T_pE^0 ⊗ C, the line of the connected part.
- Scholze's Lemma 3.3.4 reads the point of the flag variety off this sequence.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T2/p-divisible-hodge-tate-sequence`
- `HodgeTateAndCanonicalSubgroups:T0/raynaud-hodge-tate-filtration`
- `HodgeTateAndCanonicalSubgroups:T0/hodge-tate-map-compatibilities`
- `AbelianSchemesAndArithmeticModuli:A3`
- `AbelianSchemesAndArithmeticModuli:A4`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`
- `NeronModelsAndSemistableAbelianVarieties:R11.3`
- `PadicHodgeTheory:P8`

**Source matches.**

- BHW, §5.3, Remark 5.15 (arXiv:1902.03985v4), PDF p. 23: BHW's convention for the Hodge–Tate sequence of an abelian variety.
- SCH15, §3.3, Lemma 3.3.4 (arXiv v2, III.3.4), PDF p. 55: Scholze's Lemma 3.3.4 uses the filtration on points.
- CDM12, Theorem 3.20 and Remark 3.21, PDF p.20; Proposition 4.15, PDF pp.28–29: The arbitrary-C algebraic degree-one spectral sequence gives the rational sequence independently of the complete-DVR relative comparison.

### T2/relative-hodge-tate-sequence — The relative Hodge–Tate sequence on the pro-étale site

**Theorem** · proposed name `TauCeti.HodgeTate.relativeHodgeTateSequence` · implementation unchecked.

Let X/K be smooth adic, with K a complete discretely valued extension of Q_p, and let A/X be an algebraizable abelian family satisfying the P8 relative comparison hypotheses. After a chosen base extension to complete algebraically closed C if desired, on the pro-étale site there is a canonical exact sequence 0→Lie(A^∨)⊗Ô_X(1)→T_pA^∨⊗Ô_X→ω_A⊗Ô_X→0. It specializes to the rational character sequence at rank-one points through the supplied Kummer comparison and is compatible with pullback, isogenies, endomorphisms, polarizations and rational defining Hodge tensors. A family over arbitrary C without the stated descent/comparison hypotheses requires the corresponding P8 extension.

**Hypotheses.**

- A/X is an algebraizable abelian family on a smooth adic X over a complete discretely valued K; pull back the resulting sequence to complete algebraically closed C as needed.
- The terms are finite locally free completed-structure-sheaf modules furnished by P8; exactness follows from the lattice filtration theorem, not a claim that rank-one points automatically detect arbitrary O⁺ sheaf exactness.

**Proof route.**

- Construct the cohomological filtration using the two B_dR^+ lattices of T1/hodge-tate-graded-comparison and apply CS17 Corollary 2.2.4.
- In degree one the two graded pieces are Lie and invariant differentials, giving the displayed short exact sequence of Ô_X-modules after duality and the Weil twist.
- P8’s relative character comparison identifies the quotient with T0 wherever the integral family is defined; pullback and tensor compatibility follow from the relative construction.

**Acceptance instances.**

- For the universal elliptic curve over the modular curve, the sequence is 0 → ω^{-1}(1) → T_pE ⊗ Ô → ω → 0.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T2/abelian-hodge-tate-sequence`
- `HodgeTateAndCanonicalSubgroups:T1/abelian-relative-comparison`
- `HodgeTateAndCanonicalSubgroups:T1/hodge-tensor-comparison`
- `AdicEtaleGeometry:A1/pro-etale-site-corrected`
- `PerfectoidSpaces:P0/almost-basic-setup`
- `PadicHodgeTheory:P8`

**Source matches.**

- CS17, §2.2, the relative Hodge–Tate filtration (arXiv:1511.02418v1), PDF p. 15: Caraiani–Scholze: the relative Hodge–Tate filtration on the pro-étale site.

### T2/hodge-tate-flag-point — The Hodge–Tate filtration as a point of the flag variety

**Construction** · proposed name `TauCeti.HodgeTate.hodgeTateFlagPoint` · implementation unchecked.

Let Λ be a free ℤ_p-module of rank 2g with a perfect alternating pairing ψ (the Siegel case; Λ with an 𝒪-action and hermitian or symplectic form in the PEL case), and Fl the Lagrangian Grassmannian of rank-g quotients Λ ⊗ C ↠ W with Lagrangian kernel (Fl ⊂ Gr(g, Λ), Mathlib's Module.Grassmannian of rank-g quotients). For an abelian variety A over C with a symplectic similitude trivialisation β: Λ ≅ T_pA^∨, the Hodge–Tate quotient T_pA^∨ ⊗ C ↠ ω_A defines π_HT(A, β) ∈ Fl(C). Fl carries the Plücker coordinates s_J (J ⊂ {1, …, 2g}, |J| = g, J any g-element subset) and the binomial(2g,g)-indexed affinoid charts Fl_J = {|s_{J′}| ≤ |s_J| for all J′}, which cover Fl. The full GSp_2g(ℤ_p) action does not permute this finite chart family. The construction is functorial: for γ ∈ GSp(Λ ⊗ ℚ_p) with γΛ ⊂ Λ, π_HT(A′, β′) = γ·π_HT(A, β) when (A′, β′) is the corresponding isogenous pair.

**Hypotheses.**

- This is the pointwise quotient-flag construction. T2/open-tower-hodge-tate-map promotes the relative filtration to a morphism on S0’s open limit v-sheaf; T2/open-tower-levi-pullback gives its bundle formula. S1/S3 own representability, the adic incarnation and the compactified extensions (qualified RT /22).
- Convention: quotients, not lines; for g = 1 the quotient line is ω_A, so the tautological quotient bundle pulls back to ω (the BHW convention).

**Proof route.**

- Define the point from the quotient map of T2/abelian-hodge-tate-sequence transported by β; the kernel Lie(A^∨)(1) is Lagrangian (T2/abelian-hodge-tate-sequence).
- Plücker coordinates: the rank-g quotient is determined by the g × g minors of the 2g × g matrix of β-coordinates; Fl_J is the locus where s_J has maximal absolute value, and every point lies in some Fl_J.
- Equivariance under isogenies from T0/hodge-tate-map-compatibilities.

**Acceptance instances.**

- For g = 1, Fl = ℙ¹ with coordinates s_1, s_2 and charts {|s_2| ≤ |s_1|}, {|s_1| ≤ |s_2|}.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T2/abelian-hodge-tate-sequence`
- `HodgeTateAndCanonicalSubgroups:T0/hodge-tate-map-compatibilities`
- `mathlib:Module.Grassmannian`
- `ShimuraData:D3/compact-dual`
- `PELModuli:M0/symplectic-o-lattice`
- `AlgebraicModuliForArithmeticGeometry:R09.1`

**Source matches.**

- SCH15, §3.3, the affinoids Fℓ_J (arXiv v2), PDF p. 58: Scholze's definition of Fl, ω_Fl and the affinoids Fl_J.
- SCH15, §3.3, Lemma 3.3.4 (arXiv v2, III.3.4), PDF p. 55: Lemma 3.3.4: the Hodge–Tate period map on points.

**Uses.**

- Scholze 2015, Lemma 3.3.4 and §3.3: π_HT on C-points and the charts Fl_J
- PerfectoidShimuraVarieties:S1/continuous-hodge-tate-map and S3: the period map on the tower is built from this pointwise construction
- HodgeTateAndCanonicalSubgroups:T4: the balls B_r around integral points of Fl

**Planning API.**

- `TauCeti.HodgeTate.hodgeTateFlagPoint` (constructor): π_HT(A, β) ∈ Fl(C), the Hodge–Tate quotient of T_pA^∨ ⊗ C transported by β.
- `TauCeti.HodgeTate.hodgeTateFlagPoint_isLagrangian` (characterisation): The kernel of the quotient is Lagrangian for ψ.
- `TauCeti.HodgeTate.plucker` (constructor): The Plücker coordinates s_J of a rank-g quotient of Λ ⊗ C.
- `TauCeti.HodgeTate.lagrangianChart` (constructor): Fl_J = {|s_{J′}| ≤ |s_J| ∀J′}, for every g-element subset J of {1,…,2g}.
- `TauCeti.HodgeTate.lagrangianChart_cover` (relation): The binomial(2g,g)-indexed Fl_J cover Fl; no permutation action of the full integral symplectic group on this family is asserted.
- `TauCeti.HodgeTate.hodgeTateFlagPoint_equivariant` (functoriality): π_HT(A′, β′) = γ·π_HT(A, β) for the isogenous pair attached to γ.

**Mathematical tests.**

- `TauCeti.HodgeTate.hodgeTateFlagPoint_ordinaryElliptic` (computation): For E with ordinary reduction and β adapted to the connected–étale sequence, π_HT(E, β) is a ℚ_p-rational point of ℙ¹.
- `TauCeti.HodgeTate.hodgeTateFlagPoint_grassmannian` (compatibility): π_HT(A, β) is an element of Mathlib's Module.Grassmannian C (C^{2g}) g (rank-g quotients), lying in the Lagrangian locus.
- `TauCeti.HodgeTate.lagrangianChart_count` (computation): The chart index set has cardinality binomial(2g,g), hence six for g = 2. Lagrangian relations may identify some indexed chart domains; cardinality here concerns indices.
- `TauCeti.HodgeTate.hodgeTateFlagPoint_not_line` (non-example): For g = 1 the kernel line Lie(A^∨)(1) is its own symplectic orthogonal and determines exactly the same rank-one quotient point via its kernel. The tautological subbundle is Lie(A^∨)(1), whereas the tautological quotient bundle pulls back to ω_A; confusing these bundles gives the wrong twist.
- `TauCeti.HodgeTate.lagrangianChart_not_permuted` (non-example): For g = 1, γ = (1 0; 1 1) sends the unit-disc chart D₀ by z ↦ z/(z+1). Its image contains 0 and ∞ (images of 0 and −1), so it is neither D₀ nor D∞; the full integral group does not permute the two standard charts.

### T2/pel-hodge-type-filtration — PEL and Hodge-type conditions on the Hodge–Tate filtration

**Theorem** · proposed name `TauCeti.HodgeTate.pelHodgeType_filtration` · implementation unchecked.

For a characteristic-zero PEL abelian family with its specified rational endomorphism algebra, polarization and determinant type μ, the rational Hodge–Tate filtration is stable under that algebra, isotropic for the polarization, and has the prescribed μ-type. Thus its quotient flag lies in the descended PEL flag variety. For Hodge type use the rational defining tensors and rational tensor frames of B1; the filtration on every tensor construction is compatible with those tensors and has type μ, hence defines a point of the descended flag variety G/P_μ. An integral Λ or G_ℤp tensor torsor is not inferred from rational Hodge cycles.

**Hypotheses.**

- At the finite level use rational G_ℚp tensor frames; if integral frames are supplied at a chosen level, their tensor model/lattice is an additional input.
- The flag variety is the reflex-field form supplied by D3/R09.1; a rational cocharacter over that field is not invented.
- PEL determinant type follows the actual Lie-type convention; Hodge type uses CS17’s discrete type argument on each connected component.

**Proof route.**

- Endomorphism stability and isotropy follow from the functorial abelian Hodge–Tate sequence and the Weil pairing.
- Use T1/hodge-tensor-comparison to put rational defining tensors in the required filtered degree.
- Fpqc local splitting of the tensor filtration identifies its stabilizer with P_μ; constancy of type on each connected component is checked at a classical point as in CS17 Lemmas 2.3.6–2.3.7.

**Acceptance instances.**

- For the Siegel datum Fl_{G,μ} is the full Lagrangian Grassmannian; for the Hilbert datum it is Res_{F/ℚ}ℙ¹ ⊗ C = ∏_{τ: F → C} ℙ¹.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T2/hodge-tate-flag-point`
- `HodgeTateAndCanonicalSubgroups:T2/filtered-fibre-functor`
- `HodgeTateAndCanonicalSubgroups:T1/hodge-tensor-comparison`
- `HodgeTateAndCanonicalSubgroups:T0/hodge-tate-map-compatibilities`
- `PELModuli:M0/determinant-condition`
- `PELModuli:M0/integral-pel-datum`
- `AutomorphicBundles:B0/hodge-parabolic-convention`
- `ShimuraData:D3/compact-dual`
- `AutomorphicBundles:B1`
- `AlgebraicModuliForArithmeticGeometry:R09.1`

**Source matches.**

- CS17, §2.3, Lemmas 2.3.6–2.3.7, PDF pp. 19–20: Uses rational tensor frames and constant filtration type to construct the parabolic torsor.

### T2/hodge-tate-parabolic-reduction — The Hodge–Tate parabolic reduction and its Levi torsor

**Construction** · proposed name `TauCeti.HodgeTate.hodgeTateParabolicReduction` · planet **Hodge–Tate parabolic reduction** · implementation unchecked.

Let (G, X) be a Shimura datum of Hodge (or PEL) type, Sh_K → Spec E its Shimura variety at level K = K_pK^p, 𝒮 the adic space over C of Sh_K, and A → 𝒮 the abelian scheme with tensors. On 𝒮_proét, the sheaf of trivialisations β: Λ ⊗ ℚ_p ≅ V_pA^∨ respecting tensors (up to the similitude) is a G(ℚ_p)-torsor 𝒫_ét, and the relative Hodge–Tate filtration (T2/relative-hodge-tate-sequence) defines a reduction of 𝒫_ét ×^{G(ℚ_p)} G_{Ô} to the parabolic P_μ: the P_μ-torsor 𝒫_HT of trivialisations sending the standard filtration of type μ to the Hodge–Tate filtration. Its Levi quotient ℳ_HT := 𝒫_HT ×^{P_μ} M_μ is the Hodge–Tate Levi torsor. Both are functorial in K (finite-level Hecke maps), in morphisms of data and in base change of C.

**Hypotheses.**

- This is the finite-level reduction on 𝒮_proét. Its pullback along the open limit-tower map is T2/open-tower-levi-pullback. S3 imports that result for the perfectoid incarnation and proves the compactified extension.
- Use the rational tensor torsor of CS17 §2.3. For an integral G(ℤ_p)-torsor additionally specify an integral model and tensor lattice. Dynamic point subgroups in the baseline do not supply the algebraic P_μ and M_μ or their torsor quotient.

**Proof route.**

- Use the rational étale tensor frame torsor from B1; extend scalars to the completed structure sheaf.
- The type-μ tensor filtration gives the filtration-adapted frame sheaf. CS17 Lemma 2.3.6 proves its local nonemptiness by the discrete-type/classical-point argument; the representable P_μ and its torsor action come from the algebraic flag/torsor supplier.
- Push out the P_μ torsor along the actual algebraic quotient P_μ→M_μ. The baseline dynamic parabolic/Levi point subgroups are only comparisons, not replacements for this quotient.

**Acceptance instances.**

- For the modular curve over C, with a specified determinant/polarization normalization, the Levi torsor frames the two graded lines (ω^{-1}(1), ω). Before a determinant trivialization use det H¹_dR⊗ω^{-1}(1) in the first line for prime-to-p Hecke equivariance.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T2/relative-hodge-tate-sequence`
- `HodgeTateAndCanonicalSubgroups:T2/pel-hodge-type-filtration`
- `HodgeTateAndCanonicalSubgroups:T2/filtered-fibre-functor`
- `HodgeTateAndCanonicalSubgroups:T1/hodge-tensor-comparison`
- `tauceti:TauCeti.Cocharacter.parabolic`
- `tauceti:TauCeti.Cocharacter.levi`
- `AutomorphicBundles:B1/tensor-frame-torsor`
- `AdicEtaleGeometry:A1/pro-etale-site-corrected`
- `AutomorphicBundles:B1`
- `AlgebraicModuliForArithmeticGeometry:R09.1`

**Source matches.**

- CS17, §2.3, before Lemma 2.3.6 (arXiv:1511.02418v1), PDF p. 19: Caraiani–Scholze: the Hodge–Tate torsor P_p.

**Uses.**

- Caraiani–Scholze 2017, §2.3: M_dR ≅ M_p, from which automorphic bundles pull back along π_HT
- PerfectoidShimuraVarieties:S3/hodge-levi-pullback: pullback of the Levi torsor along π_HT
- HodgeTateAndCanonicalSubgroups:T6:comparison: the general logarithmic comparison agrees with this reduction for Hodge type

**Planning API.**

- `TauCeti.HodgeTate.etaleFrameTorsor` (constructor): 𝒫_ét is the G(ℚ_p)-torsor of rational tensor-preserving trivialisations Λ ⊗ ℚ_p ≅ V_pA^∨.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction` (constructor): 𝒫_HT is the P_μ-reduction of 𝒫_ét ×^{G(ℚ_p)} G_Ô defined by the relative Hodge–Tate filtration.
- `TauCeti.HodgeTate.hodgeTateLeviTorsor` (constructor): ℳ_HT = 𝒫_HT ×^{P_μ} M_μ.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction_hecke` (functoriality): Compatible with the finite-level Hecke maps Sh_{K′} → Sh_K and with prime-to-p Hecke correspondences.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction_baseChange` (functoriality): Compatible with base change C → C′ and with morphisms of Shimura data.

**Mathematical tests.**

- `TauCeti.HodgeTate.hodgeTateLeviTorsor_modularCurve` (computation): For the modular curve over C, with a specified determinant/polarization normalization, the Levi torsor frames the two graded lines (ω^{-1}(1), ω). Before a determinant trivialization use det H¹_dR⊗ω^{-1}(1) in the first line for prime-to-p Hecke equivariance.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction_torus` (degenerate): For a torus datum with μ central, P_μ = M_μ = T and 𝒫_HT = 𝒫_ét ×^{T(ℚ_p)} T_Ô.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction_not_hodge` (non-example): The Hodge–Tate parabolic P_μ is opposite to the parabolic stabilising the Hodge filtration (AutomorphicBundles B0/hodge-parabolic-convention); using the Hodge filtration's parabolic gives a different reduction whose Levi torsor differs by the inverse of μ.

### T2/de-rham-hodge-tate-levi-comparison — Cyclotomic comparison of de Rham and Hodge–Tate Levi torsors

**Theorem** · proposed name `TauCeti.HodgeTate.deRhamHodgeTateLeviComparison` · planet **Comparison of de Rham and Hodge–Tate torsors** · implementation unchecked.

For the rational Hodge-type family and parabolic reduction of T2, let ℳ_dR be the actual de Rham Levi torsor supplied by B1, pulled to the pro-étale site and extended to Ô. Let 𝒯(1) be the ℤ_p^×-torsor of Tate-module bases and let μ:ℤ_p^×→M_μ be the central cocharacter over a field defining μ. The canonical comparison is ℳ_HT ≅ ℳ_dR ×^{μ,ℤ_p^×} 𝒯(1), independent of the symplectic embedding and compatible with the natural Hecke linearizations. For a Levi representation of central μ-weight a this gives the associated HT bundle ≅ the de Rham automorphic bundle ⊗Ô(a). A chosen Tate basis over C gives an underlying untwisted isomorphism; it does not canonically descend over E_𝔭 or retain every linearization.

**Hypotheses.**

- Use rational tensor frames and the actual opposed-parabolic/Tate convention of B0/B1; μ is defined after an explicitly stated finite extension, with the intrinsic conjugacy-class descent kept separate.
- The Tate-basis torsor is a pro-étale torsor, not a globally trivial sheaf over a finite extension of ℚ_p. Its contracted product uses μ’s central image.
- The family obeys the K/algebraizability hypotheses of T1 relative comparison; do not infer integral G_ℤp frames from rational tensors.

**Proof route.**

- Pull the graded relative comparison to the Tate-basis torsor, where each twist can be trivialized. Tensor compatibility identifies the graded tensor frames there.
- Changing the Tate basis rescales the graded pieces through μ. Descend to the contracted product ℳ_dR ×^{μ,ℤ_p^×}𝒯(1), rather than to the untwisted ℳ_dR. Boxer–Pilloni §4.4.8 and Remark 4.4.23 explicitly state this correction to the raw CS17 formulation.
- Functoriality of comparison and contraction gives the stated equivariance; keep the determinant local system if no polarization/determinant trivialization has been chosen.

**Acceptance instances.**

- For the normalized modular curve the HT graded lines are ω and ω^{-1}(1); raw de Rham lines are ω and ω^{-1}. The μ-weight-one part detects the missing twist.
- For μ-weight zero representations the associated comparison is untwisted. Over a finite K/ℚ_p one cannot identify Ô(1) with Ô canonically; a C-valued Tate basis alone does not establish equivariance.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T2/hodge-tate-parabolic-reduction`
- `HodgeTateAndCanonicalSubgroups:T1/abelian-relative-comparison`
- `HodgeTateAndCanonicalSubgroups:T1/hodge-tate-graded-comparison`
- `HodgeTateAndCanonicalSubgroups:T1/hodge-tensor-comparison`
- `AutomorphicBundles:B1/filtration-reduction`
- `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`
- `AutomorphicBundles:B1`

**Source matches.**

- CS17, §2.3, Proposition 2.3.9 (arXiv:1511.02418v1), PDF p. 21: The graded comparison and tensor argument; its untwisted torsor conclusion is corrected by the cyclotomic contraction (E31).
- BPC25, §4.4.8, PDF pp.67–68; Remark 4.4.12, p.69; Remark 4.4.23, p.74: The revised manuscript gives the cyclotomic contracted product and the representation-weight twist.

### T2/filtered-fibre-functor — The Hodge–Tate tensor filtration

**Definition** · proposed name `TauCeti.HodgeTate.ExactTensorFiltration` · implementation unchecked.

Apply the shared filtered-Tannakian theory to the rational Hodge-type étale fiber functor Rep_E(G)→finite locally free Ô_X-modules: assign to each representation its ascending Hodge–Tate filtration, with strict exactness, tensor/dual compatibility and locally free graded pieces. Its constant geometric type is the μ-conjugacy class. For an algebraic E-scheme S and an exact filtered fiber functor with reductive tensor automorphism group, Ziegler’s theorem gives fpqc-local splittings; the filtered stabilizer is parabolic, its graded quotient has unipotent kernel, and a chosen splitting identifies a Levi with the centralizer. This general theorem is a requested ReductiveGroups Part II extension, not a second generic theory owned by T2. On the Shimura pro-étale site the stronger torsor assertion is obtained by CS17’s rational comparison and type argument; it is not a blanket change from fpqc to pro-étale splitting.

**Hypotheses.**

- E is a characteristic-zero field and G/E reductive of finite type; Rep_E(G) has a tensor generator.
- Filtered objects are exhaustive, separated, finite, strict under exact sequences, and have finite locally free graded pieces. An arbitrary filtration is not a filtered fiber functor.
- No general integral ℤ_p variant, strictly henselian splitting theorem or universal étale/pro-étale splitting assertion is included.

**Proof route.**

- Import representations/comodules and tensor reconstruction from the existing ReductiveGroups roadmap; import general filtered fiber functors/splitting from the proposed Part II extension recorded as a gap.
- Ziegler Definition 3.4 and Theorems 3.14, 3.15 and 3.52 provide the precise fpqc splitting and reductive stabilizer statements.
- Apply T1’s tensor-compatible two-lattice filtration to each representation. CS17 Lemmas 2.3.6–2.3.7 identify its μ-type and the Shimura pro-étale frame torsor.

**Acceptance instances.**

- For G = GL_n and μ = (1, …, 1, 0, …, 0), an exact tensor filtration of type μ is a two-step filtration of the standard representation by a direct summand of rank r, and G/P_μ is the Grassmannian.

**Inputs.**

- `tauceti:TauCeti.Cocharacter.parabolic`
- `tauceti:TauCeti.Cocharacter.levi`
- `mathlib:Module.Grassmannian`
- `AutomorphicBundles:B0/hodge-parabolic-convention`
- `ShimuraData:D3/filtration-parabolic`

**Source matches.**

- ZIE, §3.5, Theorem 3.52, PDF pp.27–28 (reductive case part (iii), p.28): Strict exact tensor filtrations split fpqc locally, and reductive automorphism groups give parabolic stabilizers.
- CS17, §2.3, Lemmas 2.3.6–2.3.7, PDF pp. 19–20: The relative Hodge–Tate tensor filtration has the fixed Shimura cocharacter type.

**Uses.**

- Caraiani–Scholze 2017, Lemma 2.3.6: the Hodge–Tate filtration has type μ, giving the P_μ-torsor P_p
- HodgeTateAndCanonicalSubgroups:T6:comparison/lattice-hodge-tate-filtration: the Tannakian extraction of a flag of prescribed type (requested from T2)
- HodgeTateAndCanonicalSubgroups:T2/hodge-tate-parabolic-reduction: the P_μ-reduction

**Planning API.**

- `TauCeti.HodgeTate.ExactTensorFiltration` (structure): The rational Hodge–Tate filtered fiber functor on Rep_E(G), as an application of the shared strict filtered-Tannakian category.
- `TauCeti.HodgeTate.ExactTensorFiltration.type` (projection): The type: the conjugacy class of a splitting cocharacter (locally constant on Spec R).
- `TauCeti.HodgeTate.ExactTensorFiltration.splitLocally` (characterisation): For the algebraic filtered-fiber-functor input, a splitting exists fpqc locally by Ziegler Theorem 3.14. For the Shimura completed-structure-sheaf application use CS17’s separate frame-torsor theorem.
- `TauCeti.HodgeTate.ExactTensorFiltration.frameTorsor` (constructor): The P_μ-torsor of frames carrying Fil^•(μ) to the given filtration.
- `TauCeti.HodgeTate.ExactTensorFiltration.equivFlag` (equivalence): Filtrations of type μ ≅ (G/P_μ)(R).

**Mathematical tests.**

- `TauCeti.HodgeTate.ExactTensorFiltration.gl_grassmannian` (compatibility): For G = GL_n and μ of type (1^r, 0^{n−r}), filtrations of type μ are the elements of Mathlib's Module.Grassmannian R (R^n) (n − r).
- `TauCeti.HodgeTate.ExactTensorFiltration.trivial` (degenerate): For central μ and a supplied underlying tensor frame, the weight filtration needs no proper parabolic reduction and its framed torsor is trivial. Without that frame the underlying G-torsor need not be trivial.
- `TauCeti.HodgeTate.ExactTensorFiltration.not_arbitrary_filtration` (non-example): A rank-one R-module filtered by a non-direct-summand ideal with nonflat quotient does not satisfy the locally free graded-piece/strict exact tensor-filtration contract; for example (2)⊂ℤ at the local prime 2.

### T2/open-tower-hodge-tate-map — Hodge–Tate map on the open limit tower

**Construction** · proposed name `TauCeti.HodgeTate.openTowerHodgeTateMap` · planet **Hodge–Tate period map** · implementation unchecked.

For a Hodge-type datum with sufficiently small tame level K^p and rational tensor frames, let S_∞^◇=lim_{K_p}S_{K^pK_p}^◇ be S0’s open tower over C. There is a canonical morphism of v-sheaves π_HT:S_∞^◇→Fl_{G,μ}^{an,◇}, defined by the relative type-μ filtration in the universal rational Tate frame. It is independent of a chosen Siegel embedding, equivariant for G(ℚ_p) and for prime-to-p Hecke translations between tame levels (trivial action on the flag for the latter). Its evaluation on any perfectoid test object is the tensor filtration quotient, and on geometric points it is T2’s Hodge–Tate flag point. Perfectoid representability of S_∞^◇ is not a hypothesis.

**Hypotheses.**

- Use S0’s genuine limit v-sheaf and compatible universal rational Tate trivialization; the finite-level families meet T1’s comparison hypotheses. The tower itself and its right G(ℚ_p)-action are imports, not new definitions.
- The descended flag is the reflex-field form. A cocharacter or split Hilbert factorization requires an explicitly stated extension. Fix the dual-Tate quotient convention and transport the flag action accordingly; T4 converts it to BHW’s left action.
- P9 must transfer the finite-level relative filtration/frame reduction to all perfectoid untilts, functorially and with effective locally free descent; D6 supplies diamondization of the analytic flag. A geometric-point assignment alone does not define this morphism.

**Proof route.**

- Pull T2’s relative exact sequence and rational tensor-frame reduction along each projection of S0’s limit sheaf, using the universal Tate trivialization. On a perfectoid test untilt the resulting locally free tensor filtration of type μ represents a map to the analytic flag by R09.1’s universal property.
- P9’s functorial completed pullback/descent contract and D6’s diamond functor give compatible sections on every perfectoid test object. Their compatibility with restriction and v-descent produces the morphism; this sheaf construction precedes S2 representability. CS17 §2.3, after Lemma 2.3.7, uses the same relative frame-to-flag construction on its representing tower.
- Changing rational frames by G(ℚ_p) gives the specified flag action. Naturality under the Hecke isogenies gives prime-to-p equivariance. CS17 Lemma 2.3.7’s tensor-idempotent argument establishes embedding independence; do not merely compare classical points.

**Acceptance instances.**

- The elliptic quotient, central-cocharacter and unsplit Hilbert test cases below all evaluate the relative construction on perfectoid test families.
- On a perfectoid representative supplied later by S2, this morphism is the diamond of S3’s adic period morphism; representability is used only for that realization.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T2/relative-hodge-tate-sequence`
- `HodgeTateAndCanonicalSubgroups:T2/pel-hodge-type-filtration`
- `HodgeTateAndCanonicalSubgroups:T2/hodge-tate-parabolic-reduction`
- `HodgeTateAndCanonicalSubgroups:T2/hodge-tate-flag-point`
- `PerfectoidShimuraVarieties:S0/infinite-level-diamond`
- `PerfectoidShimuraVarieties:S0/tower-right-action`
- `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`
- `AlgebraicModuliForArithmeticGeometry:R09.1`
- `PerfectoidSpaces:P9`

**Source matches.**

- CS17, §2.1, Theorems 2.1.2–2.1.3, PDF pp.11–12; §2.3, Lemma 2.3.7 and subsequent frame-to-flag construction, pp.20–21: The relative tensor-frame construction and equivariance on the represented tower; its v-sheaf precursor is deduced using the explicit supplier transfer/descent contract.
- BPC25, §4.4.22–4.4.24, PDF pp.73–75: Universal rational frames, relative reduction and the open Hodge-type period map; the source proves the perfectoid incarnation downstream.

**Uses.**

- HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate: Defines the coordinate as a function on the open tower before S1–S3.
- HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift: Provides the relative quotient line and its tautological section on the open anticanonical tower.
- PerfectoidShimuraVarieties:S3: Supplies the sheaf map to be realized on the perfectoid representative and extended to compactifications.

**Planning API.**

- `TauCeti.HodgeTate.openTowerHodgeTateMap` (constructor): The v-sheaf morphism determined by the universal relative tensor filtration.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_ext` (extensionality): Two candidate maps agree if their natural evaluations agree on every perfectoid test object, not merely on geometric points.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_eval` (simp): On each perfectoid test untilt evaluation is the type-μ relative filtration quotient.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_point` (compatibility): On (C′,C′⁺)-points the map equals hodgeTateFlagPoint with the fixed quotient convention.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_equivariant` (functoriality): π_HT composed with a tower translation equals the induced flag translation composed with π_HT, with the chosen left/right dictionary.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_hecke` (functoriality): Prime-to-p translation between tame levels commutes with π_HT and acts trivially on the flag.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_baseChange` (functoriality): Base extending C and the tower commutes with the map, without choosing a splitting of F beforehand.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_embedding` (compatibility): Under a Hodge-type Siegel embedding the two period maps commute with the corresponding flag embedding; its construction is independent of that choice.

**Mathematical tests.**

- `TauCeti.HodgeTate.openTowerHodgeTateMap_modular` (compatibility): For GL₂, evaluation on a perfectoid test family gives the kernel of the relative quotient to ω_E, with the tautological quotient pulling back to ω_E.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_torus` (degenerate): For a central cocharacter the flag is a point, hence the map is its structural morphism regardless of whether the tower has a perfectoid representative.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_hilbertUnsplit` (compatibility): For the Hodge-type Hilbert G* datum the target is (Res_{F/ℚ}ℙ¹)^{an,◇}; an embedding-product identification is asserted only after a specified splitting extension.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_kernelQuotient` (non-example): For an elliptic family the kernel line is ω_E^{-1}(1) (with determinant normalization), while the quotient is ω_E. Substituting the tautological subline for the quotient changes the bundle and twist.

Added by independent review `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

### T2/open-tower-levi-pullback — Open-tower Levi pullback and elliptic/Hilbert bundle formulas

**Theorem** · proposed name `TauCeti.HodgeTate.openTowerLeviPullback` · planet **Hodge–Tate automorphic bundle pullback** · implementation unchecked.

Along T2’s open-tower π_HT, the tautological Levi torsor of the Hodge–Tate flag pulls back to ℳ_HT on the limit v-sheaf. Hence an associated Levi representation of central μ-weight a pulls back to the finite-level de Rham automorphic bundle tensored with Ô(a), by the cyclotomic comparison. In the dual-Tate quotient convention the elliptic tautological quotient 𝒪(1) pulls back to ω_E; for the Hodge-type Hilbert G* datum the flag is (Res_{F/ℚ}ℙ¹)^{an,◇} and π_HT*Res_{𝒪_F/ℤ}𝒪(1)≅ω_A as a rank-[F:ℚ] bundle with its Res G_m-action. These identifications hold before perfectoid representability; they inherit the transported frame/Hecke linearizations.

**Hypotheses.**

- Import the actual homogeneous parabolic and Levi torsors from R09.1/B0, rather than their point-subgroup substitutes or a downstream S3 theorem. The automorphic representation is inflated from the common Levi.
- For the Hilbert quotient, level structures use T_pA^∨ and the polarization ideal convention of H2/H4. Over an unsplit field do not replace the restriction of scalars by an embedding-indexed product or its integral tensor order by its normalization.
- The O(1) formula uses BHW’s kernel/quotient action on projective space, transported from CS17’s standard-representation convention. Raw CS17-compatible representations retain their μ-weight twist; no untwisted equivariance is inferred from a choice of roots of unity.

**Proof route.**

- The pullback of the universal parabolic frame torsor along the relative filtration map is exactly the adapted frame torsor. Passing to its Levi quotient commutes with pullback by the supplied torsor universal property.
- Apply T2’s corrected cyclotomic Levi comparison and associated-bundle functor. For GL₂ identify the universal quotient with the actual relative character quotient to ω_E; this computes the O(1) convention directly, without erasing twists in other representations.
- For G* use the O_F-linear rank-one quotient and the representability/universal bundle of restriction of scalars. The quotient map identifies its pulled-back bundle with ω_A. After an explicit splitting extension this is the direct sum of the embedding-indexed quotient lines; faithful base change descends the identification. BHW §5.3–5.4 states this unsplit construction.

**Acceptance instances.**

- At an elliptic point with normalized determinant, the quotient line is ω_E and the subline is ω_E^{-1}(1).
- After a splitting extension of F the Hilbert rank-[F:ℚ] bundle is ⊕_σ𝒪(1)_σ; before it the restriction-of-scalars bundle is retained.
- For μ-weight a the raw associated bundle formula includes (a); a=0 is the untwisted special case.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T2/open-tower-hodge-tate-map`
- `HodgeTateAndCanonicalSubgroups:T2/de-rham-hodge-tate-levi-comparison`
- `HodgeTateAndCanonicalSubgroups:T2/abelian-hodge-tate-sequence`
- `AlgebraicModuliForArithmeticGeometry:R09.1`
- `AutomorphicBundles:B0/hodge-parabolic-convention`
- `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`
- `HilbertModularVarietiesAndShimuraCurves:H2`
- `HilbertModularVarietiesAndShimuraCurves:H4`
- `PerfectoidSpaces:P9`

**Source matches.**

- CS17, §2.3, Lemma 2.3.8 and Proposition 2.3.9, PDF p.21: Relative Levi frame pullback; E31 corrects the raw untwisted comparison.
- BPC25, §4.4.8, PDF pp.67–68; Remark 4.4.12, p.69; Remarks 4.4.23–4.4.24, pp.74–75: Cyclotomic torsor contraction and representation-weight bundle pullback.
- BHW, §3.3, (3.2) and Lemma 3.17, PDF pp.12–13; §5.3, Remark 5.15, p.23; §5.4, Definitions 5.22–5.24 and Proposition 5.25/Remark 5.28, pp.25–26: Quotient O(1) formula, Hilbert restriction of scalars and the explicitly conditional splitting.

Added by independent review `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

**Coverage: planned.**

- Valuation-ring Fitting and the integral O_C Faltings complex: Import the StableReduction general Fitting direction, and request its nonnoetherian finite-presentation valuation specialization from R07.1. CDM12 Theorem 4.13 independently supplies the bounded integral complex and zero composite; R07.1’s existing complete-noetherian-local dimension statements do not cover O_C, and its finite-to-p-divisible embedding must have exact hypotheses.
- Boundary one-motives and arbitrary-C Raynaud realization: C4 supplies polarized [Y→G̃], the finite-flat torsion pieces and integral overlap uniqueness, plus arbitrary-base semi-abelian Verschiebung. R11.3 supplies the descent/existence or complete-C uniformization extension beyond its current DVR statements. Boundary coordinate estimates use the full height-2g dual one-motive realization, not the smaller finite Raynaud group.
- Relative character comparison and Tate-normalized rational tensors: P8 supplies the two horizontal B_dR^+ lattices and relative Kummer edge-map compatibility of CS17 §2.2; CDM12 Proposition 4.15 is the independently read good-reduction pointwise reference. B1 supplies rational defining tensors and central-μ contraction with the Tate-basis torsor. CS17’s raw untwisted conclusion is corrected by Boxer–Pilloni §4.4.8/Remark 4.4.23 (E31). General-C families outside the stated K-descent hypothesis and integral G_ℤp frames require separate extensions. P8 also supplies the absolute arbitrary-C algebraic degree-one spectral sequence and A4 its H¹O/invariant-differential identifications; this does not assume finite-Q_p descent.
- Shared filtered-Tannakian Part II and representable torsors: Ziegler Definition 3.4, Theorems 3.14–3.15 and 3.52 establish the precise algebraic strict/fpqc statements. The proposed ReductiveGroups Part II extension must expose them. R09.1/B0 supply the representable flag and actual parabolic quotient; pinned dynamic point subgroups are insufficient. CS17’s separate pro-étale type argument governs the Shimura application.
- Open-tower relative filtration transfer: S0’s existing limit v-sheaf and action statements were read, as was D6’s diamond functor. P9 must expose functorial completed relative filtration/frame pullback on all perfectoid test untilts and effective locally free/Levi descent, compatible with the universal flag. This exact interface is not the existing coefficient-product invariant-ring contract. R09.1/B0 must expose the homogeneous Hodge–Tate flag/Levi universal torsor upstream of S3. Neither perfectoid representability nor geometric-point evaluation substitutes for these inputs.

## T3 — All-prime weak formal existence, strict p≥3 HN characterizations, truncated conormal estimates and Hilbert generator requests are kept distinct. Lifting and rigidity have separate foundations.

### T3/hasse-neighbourhood — The Hasse valuation and Hasse neighbourhoods

**Definition** · proposed name `TauCeti.HodgeTate.hasseNeighbourhood` · planet **Hasse neighbourhood** · implementation unchecked.

(Points) For a truncated Barsotti–Tate group G over O_K (K complete valued over ℚ_p, v(p) = 1), the Hasse valuation is Ha(G) := min(v(Ha(G ⊗ O_K/p)), 1) ∈ [0, 1], where Ha(G ⊗ O_K/p) is the Hasse invariant of the BT₁ G[p] ⊗ O_K/p (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2) computed in a basis of det ω; it is independent of the basis and of valued extensions, and Ha(G) = Ha(G^D). (Families) For R a p-adically complete flat ℤ_p^cycl-algebra (or O_K-algebra) and A/R an abelian (or semi-abelian) scheme with reduction A₁/(R/p), A satisfies the Hasse condition of radius ε (0 ≤ ε < 1, ε ∈ v(ℤ_p^cycl)) if Ha(A₁) divides p^ε, i.e. there is u ∈ H⁰(Spf R, ω^{⊗(1−p)}) with u·Ha(A₁) = p^ε in R/p. For a formal model 𝔛 of a Shimura variety with universal A, the Hasse neighbourhood 𝔛(ε) is the formal scheme of pairs (f, u) as above modulo u ∼ u(1 + p^{1−ε}h); its generic fibre 𝒳(ε) is the open {|Ha| ≥ |p|^ε} of the generic fibre, and 𝒳(ε) ⊂ 𝒳(ε′) for ε ≤ ε′.

**Hypotheses.**

- Hasse invariant of BT₁ groups: owned by FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 (RT-AREA-padic-1/26); for (semi-)abelian schemes it is T0/semi-abelian-hasse-invariant.
- Hilbert data use the total Hasse invariant (product of the partial Hasse invariants) of HilbertModularVarietiesAndShimuraCurves H2/ShimuraCompactifications C6; the Siegel and PEL data use T0's Ha.
- 𝔛(ε) is an open chart of the admissible blow-up of the ideal (H̃a, p^ε), not the whole blow-up (PAPER-SCHOLZE-15/E3).

**Proof route.**

- Pointwise: Fargues 2011 §2.2.1 (valuation of det ψ_G, truncated at 1); duality Ha(G) = Ha(G^D) from R07.2's LF.
- Families: Scholze, Definition 3.2.12 and Lemma 3.2.13: locally 𝔛(ε) = Spf(R⟨u⟩/(u·H̃a − p^ε)) for a lift H̃a, flat over ℤ_p^cycl; this is the section domain of AdicSpacesPartII R2/section-valuation-domain and its formal model R2/section-domain-formal-model. As an admissible formal model, the chart is taken after removing p-power torsion, with normalisation when required by the supplier; do not assume the raw displayed quotient is flat for every R.

**Acceptance instances.**

- For an ordinary BT₁, Ha = 0; for E[p] with E supersingular, Ha(E[p]) ∈ (0, 1].
- 𝒳(0) is the ordinary locus of the generic fibre.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-hasse-invariant`
- `HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-minimal-compactification`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`
- `AdicSpacesPartII:R2/section-valuation-domain`
- `AdicSpacesPartII:R2/section-domain-formal-model`
- `HilbertModularVarietiesAndShimuraCurves:H2`
- `ShimuraCompactifications:C6/hilbert-hasse-boundary-comparison`

**Source matches.**

- FAR11, §2.2.1, PDF p. 7: Fargues's Hasse valuation of a BT₁ over O_K.
- SCH15, §3.2.2, Definition 3.2.12, p. 38 (arXiv v2): The Hasse neighbourhood functor.
- SCH15, §3.2.2, after Lemma 3.2.13, p. 38: Generic fibre {|Ha| ≥ |p|^ε}.

**Uses.**

- Scholze 2015, §§3.2.1–3.2.2: canonical subgroups exist on 𝔛(ε), ε < 1/2
- Fargues 2011, Théorèmes 4 and 6: explicit bounds on Ha(G)
- BHW 2019, §§3–5: Hilbert Hasse neighbourhoods X(ε) and overconvergence radii

**Planning API.**

- `TauCeti.HodgeTate.hasseValuation` (constructor): Ha(G) ∈ [0, 1] for a truncated BT group over O_K.
- `TauCeti.HodgeTate.hasseValuation_dual` (relation): Ha(G^D) = Ha(G).
- `TauCeti.HodgeTate.hasseValuation_eq_zero_iff` (characterisation): Ha(G) = 0 iff G is ordinary.
- `TauCeti.HodgeTate.hasseNeighbourhood` (constructor): 𝔛(ε): pairs (f, u) with u·Ha = p^ε mod p, modulo u ∼ u(1 + p^{1−ε}h).
- `TauCeti.HodgeTate.hasseNeighbourhood_generic` (characterisation): The generic fibre of 𝔛(ε) is {|Ha| ≥ |p|^ε}.
- `TauCeti.HodgeTate.hasseNeighbourhood_mono` (relation): 𝔛(ε) → 𝔛(ε′) is an open immersion on generic fibres for ε ≤ ε′.

**Mathematical tests.**

- `TauCeti.HodgeTate.hasseValuation_ordinary` (degenerate): Ha(μ_{p^∞}[p] ⊕ ℚ_p/ℤ_p[p]) = 0.
- `TauCeti.HodgeTate.hasseValuation_le_one` (characterisation): 0 ≤ Ha(G) ≤ 1 for every BT₁ over O_K (truncation at 1, because it is computed in O_K/p).
- `TauCeti.HodgeTate.hasseNeighbourhood_zero` (computation): 𝒳(0) is the ordinary locus {|Ha| = 1}.
- `TauCeti.HodgeTate.hasseNeighbourhood_not_blowup` (non-example): 𝔛(ε) is not the full admissible blow-up of (H̃a, p^ε): the chart where p^ε generates is omitted.

### T3/subgroup-lifting — Lifting subgroups modulo p with explicit error

**Theorem** · proposed name `TauCeti.HodgeTate.subgroupLifting` · implementation unchecked.

Let R be a p-adically complete flat ℤ_p^cycl-algebra, G a finite locally free commutative group scheme over R and C₁ ⊂ G ⊗_R R/p a finite locally free subgroup. If, for H = (G ⊗ R/p)/C₁, multiplication by p^ε on the co-Lie complex ℓ̌_H is homotopic to 0 for some 0 ≤ ε < 1/2, then there is a finite locally free subgroup C ⊂ G over R with C ⊗ R/p^{1−ε} = C₁ ⊗ R/p^{1−ε}.

**Hypotheses.**

- R is p-adically complete and torsion-free over the chosen rank-one cyclotomic valuation base containing the fractional powers used in the statement.
- The quotient group over R/p is finite locally free; the co-Lie nullhomotopy and functorial square-zero obstruction theory are the R07.6 specialization of DD.0.
- Illusie II is not a cleared source in the local library. The explicit consequence and iterative argument are read in SCH15 III.2.2 and HALO Proposition A.1; the group-deformation foundation remains a supplier request.

**Proof route.**

- Apply the functorial obstruction theory along the two square-zero thickenings used in SCH15 Corollary III.2.2; their obstruction transition is multiplication by the chosen annihilator, hence zero by the co-Lie nullhomotopy.
- Lift the subgroup from precision 1−ε to 2−2ε. Because ε<1/2, iteration increases the precision without bound.
- Use the finite-presentation/effectivity and completeness theorem of R07.6 to obtain a finite locally free subgroup over R, with the stated reduction.

**Acceptance instances.**

- For ε = 0 and H étale, C₁ lifts uniquely (H étale means ℓ̌_H ≃ 0).

**Inputs.**

- `mathlib:IsAdicComplete`
- `tauceti:TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`

**Source matches.**

- SCH15, Corollary III.2.2 and its proof, PDF pp. 30–31: States the subgroup lifting consequence of the co-Lie nullhomotopy.
- HALO, Appendix A.1, Proposition A.1, PDF pp. 37–38: Gives the same lifting mechanism over a complete torsion-free adic base, including p=2.

### T3/section-rigidity — Sections agreeing to high order are equal

**Lemma** · proposed name `TauCeti.HodgeTate.sectionRigidity` · implementation unchecked.

Let O be a rank-one mixed-characteristic valuation ring containing scalars p^ε,p^δ, let R be a p-adically complete O-flat algebra, and X=Spec A affine of finite presentation over R with p^εΩ¹_{A/R}=0. If two R-sections s,t agree modulo p^δ and δ>ε, then s=t. The same comparison glues on a common affine cover. No smoothness hypothesis or assertion that every section lifts is needed: the theorem compares two sections that already exist.

**Hypotheses.**

- δ>ε strictly; R is separated as well as complete, and O-flatness supplies the colon-ideal computation.
- The affine statement covers the finite group quotients used in canonical-subgroup uniqueness; any global version requires common affine localization and gluing.

**Proof route.**

- For s,t agreeing modulo p^a, their difference modulo p^{2a} is an R-derivation A→p^aR/p^{2a}R: cross terms vanish in the square-zero ideal.
- The universal property of Ω¹ and p^εΩ¹=0 force the difference into p^{2a−ε}R/p^{2a}R, using O-flatness. Thus agreement improves from a to 2a−ε (HALO Lemma A.2).
- Iterate a_{k+1}=2a_k−ε; since a_0=δ>ε, a_k tends to infinity. Separatedness gives equality of the original ring maps. This uses no obstruction to existence of lifts.

**Acceptance instances.**

- Used with Ω¹ of A[p^m]/C killed by p^ε to show that two candidate canonical subgroups coincide.

**Inputs.**

- `mathlib:IsAdicComplete`
- `mathlib:KaehlerDifferential`

**Source matches.**

- SCH15, Lemma III.2.4, PDF p. 32: The annihilator of differentials forces equality at improving p-adic precision.
- HALO, Appendix A.1, Lemma A.2, PDF p. 38: Computes the difference of two existing lifts in a square-zero ideal.

### T3/canonical-subgroup — Weak and strong canonical subgroups of level m

**Definition** · proposed name `TauCeti.HodgeTate.canonicalSubgroup` · planet **Canonical subgroup** · implementation unchecked.

Let R be a complete p-torsion-free cyclotomic valuation-base algebra and A/R abelian of dimension g. For m≥1 put S_m=(p^m−1)/(p−1). A weak level-m canonical subgroup is the unique finite locally free subgroup C_m⊂A[p^m] reducing to ker F^m modulo p^{1−η}, under Ha(A mod p)^{S_m}|p^η with η<1/2. A strong sufficient condition is Ha^{p^m}|p^η with η<1/2. This is independent of the permitted η by uniqueness. The analogous finite BT-level construction uses the co-Lie lifting theorem with its explicit truncation hypotheses. A boundary version uses the supplied finite-height Raynaud/one-motive chart, not a constant-height abelian group across strata.

**Hypotheses.**

- p is arbitrary, including p = 2: the deformation-theoretic construction (Scholze) is uniform in p; Fargues's pointwise Harder–Narasimhan construction needs p ≠ 2 and the bounds of T3/canonical-subgroup-theorem (2).
- The base ring may be replaced by any p-adically complete flat algebra over a sufficiently ramified extension of ℤ_p containing elements of valuation ε.

**Proof route.**

- Construct C_m using the subgroup lifting theorem and the annihilator Ha^{S_m} of the relevant co-Lie quotient.
- Compare two candidates through the quotient and section rigidity at precision 1−η>η; this proves uniqueness and independence of η.
- The strong condition implies the weak condition since S_m≤p^m; use the appropriate finite-BT chart supplier for the same construction.

**Acceptance instances.**

- For A ordinary (Ha a unit) C_m is the connected part A[p^m]^0, of multiplicative type.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T3/hasse-neighbourhood`
- `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-hasse-invariant`
- `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-torsion`
- `HodgeTateAndCanonicalSubgroups:T3/subgroup-lifting`
- `HodgeTateAndCanonicalSubgroups:T3/section-rigidity`

**Source matches.**

- SCH15, §3.2.1, Definition 3.2.7, p. 34 (arXiv v2): Definition 3.2.7 (weak).
- SCH15, §3.2.1, Definition 3.2.7, p. 34: Definition 3.2.7 (strong).

**Uses.**

- Scholze 2015, Theorem 3.2.15: canonical Frobenius lifts and the anticanonical tower (PerfectoidShimuraVarieties S1)
- BHW 2019, §§3–5: Hilbert canonical subgroups and the anticanonical tower
- HodgeTateAndCanonicalSubgroups:T4: canonical and anticanonical loci at Γ₀(p^n) level
- HodgeTateAndCanonicalSubgroups:T5: Igusa torsors of the dual canonical subgroup and ω^int

**Planning API.**

- `TauCeti.HodgeTate.canonicalSubgroup` (constructor): C_m ⊂ A[p^m] on the locus where Ha^{(p^m−1)/(p−1)} | p^ε, ε < 1/2.
- `TauCeti.HodgeTate.canonicalSubgroup_modFrobenius` (characterisation): C_m ≡ ker F^m mod p^{1−ε}, and C_m is the unique closed finite locally free subgroup with this property.
- `TauCeti.HodgeTate.canonicalSubgroup_points` (characterisation): C_m(R′) ⊇ {s ∈ A[p^m](R′) | s ≡ 0 mod p^{(1−ε)/p^m}}, with equality for R′ integrally closed in R′[1/p] (corrected form of Scholze's Corollary 3.2.6, PAPER-SCHOLZE-15/E17).
- `TauCeti.HodgeTate.canonicalSubgroup_degree` (relation): At a rank-one point with Ha(A[p^m]) < 1/(2p^{m−1}) (p ≥ 5), deg C_m = mg − ((p^m − 1)/(p − 1))·Ha.
- `TauCeti.HodgeTate.canonicalSubgroup_isotropic` (relation): C_m is maximal totally isotropic for the Weil pairing of a principal polarisation.
- `TauCeti.HodgeTate.canonicalSubgroup_baseChange` (functoriality): Formation of C_m commutes with base change R → R′ of p-adically complete flat algebras.
- `TauCeti.HodgeTate.canonicalSubgroup_level` (relation): C_{m′} = C_m[p^{m′}] for m′ ≤ m (strong subgroups).

**Mathematical tests.**

- `TauCeti.HodgeTate.canonicalSubgroup_ordinary` (degenerate): If Ha(A₁) is a unit, C_m = A[p^m]^0 (multiplicative).
- `TauCeti.HodgeTate.canonicalSubgroup_ellipticDegree` (computation): For E elliptic over O_C with Ha(E[p]) = w < 1/2 and p ≥ 5, deg C₁ = 1 − w and deg(E[p]/C₁) = w.
- `TauCeti.HodgeTate.canonicalSubgroup_not_constant` (non-example): C_m is in general not isomorphic to the constant group (ℤ/p^m)^g over R: for A ordinary it is multiplicative, μ_{p^m}^g étale-locally; only its geometric generic points are (ℤ/p^m)^g.
- `TauCeti.HodgeTate.canonicalSubgroup_points_strict` (non-example): The printed equality of Corollary 3.2.6 fails over non-normal R′: for R′ = {(a, b) ∈ O_C² | a ≡ b mod p^{1/(p−1)}}, A ordinary, ε = 0, s = (ζ_p, 1) ∈ C₁(R′) is not ≡ 0 mod p^{1/p}.

### T3/pointwise-quotient-hasse — Hasse height of a supplied Frobenius-congruent quotient

**Lemma** · proposed name `TauCeti.HodgeTate.pointwiseQuotientHasse` · implementation unchecked.

Let G be BT₂ over O_C, p≠2, with Hasse height w<1. Supply a finite flat C⊂G[p] of height dim G and a BT₁ quotient E=p^{−1}C/C. Assume C reduces to ker F modulo p^{1−w}, with the compatible quotient/conormal identification. Then min(Ha(E),1−w)=min(pw,1−w). In particular Ha(E)=pw for w<1/(p+1), and Ha(E)≥1−w for w≥1/(p+1). This statement assumes the subgroup and quotient; it proves no canonical-subgroup existence.

**Hypotheses.**

- C, E and their base-change/BT/conormal compatibilities are supplied by R07.1.
- Use the arbitrary-characteristic-p-base Hasse theory of R07.2. Normalize v(p)=1 and truncate Hasse heights at 1.

**Proof route.**

- Over a base killed by p, Frobenius identifies p^{−1}ker F/ker F with G[p]^(p); its conormal determinant transports the Hasse section to its pth tensor power.
- Reduce the supplied C and E modulo p^{1−w}. Equality of these Hasse sections gives equality of their valuations truncated at 1−w, as in the proof of FAR11 Theorem 5.
- Compare pw with 1−w to obtain the two stated branches. No invocation of the main canonical-subgroup theorem occurs.

**Acceptance instances.**

- For w=0 the supplied Frobenius-congruent quotient has Hasse height zero.
- For p=5 and w=1/10 the height is 1/2; at w=1/6 only the lower bound 5/6 follows.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T3/hasse-neighbourhood`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`

**Source matches.**

- FAR11, §7.4, proof of Théorème 5, PDF pp.37–38: The truncated Hasse identity in the proof uses only the supplied Frobenius congruence, allowing it before canonical-subgroup induction.

Added by independent review `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

### T3/canonical-subgroup-theorem — Existence, uniqueness and characterisations of canonical subgroups

**Theorem** · proposed name `TauCeti.HodgeTate.canonicalSubgroup_theorem` · planet **Canonical subgroup theorem** · implementation unchecked.

(1) (Families, all p.) Let R be a p-adically complete flat ℤ_p^cycl-algebra and A/R an abelian scheme with Ha(A₁)^{(p^m−1)/(p−1)} | p^ε, ε < 1/2. There is a unique closed subgroup C_m ⊂ A[p^m], finite locally free over R, with C_m = ker F^m modulo p^{1−ε}; for every p-adically complete flat R-algebra R′, C_m(R′) ⊇ {s ∈ A[p^m](R′) | s ≡ 0 mod p^{(1−ε)/p^m}}, with equality when R′ is integrally closed in R′[1/p]. (2) (Points, p ≠ 2.) Let G be a truncated Barsotti–Tate group of level n, height h and dimension d < h over O_C with Ha(G) < 1/(2p^{n−1}) if p ≥ 5 and Ha(G) < 1/3^n if p = 3. Then the Harder–Narasimhan filtration of G (Fargues 2010) has a step C with C(O_C) free of rank d over ℤ/p^n; deg(G/C) = ((p^n − 1)/(p − 1))·Ha(G); for 1 ≤ k ≤ n, C_k := C[p^k] is the analogous step of G[p^k] and C_k ⊗ O_C/p^{1−p^{k−1}Ha(G)} is the kernel of F^k; C(O_C) = ker α_{G, n−((p^n−1)/(p−1))Ha(G)}, the kernel of the Hodge–Tate map of G reduced modulo p^{n−((p^n−1)/(p−1))Ha(G)}; and C(O_C)^⊥ ⊂ G^D(O_C) is the corresponding step of G^D. When G = A[p^n] for A as in (1) over R = O_C and both apply, the two subgroups coincide.

**Hypotheses.**

- (1) is Scholze's Corollary 3.2.6 with the integral-points formula corrected as recorded in PAPER-SCHOLZE-15/E17 (equality only for R′ integrally closed in R′[1/p]); uniqueness is proved through T3/section-rigidity, not through the printed formula.
- (2) is Fargues 2011, Théorèmes 4 and 6, stated for p ≠ 2; p = 2 is covered by (1) only.
- For n = 1 and p ≥ 5 the bound is Ha(G) < 1/2; for p = 3 it is Ha(G) < 1/3.

**Proof route.**

- (1) Existence: H₁ := ker(V^m: A₁^{(p^m)} → A₁) has co-Lie complex Lie A₁^{(p^m)} → Lie A₁ with determinant Ha^{(p^m−1)/(p−1)}, so p^ε ≃ 0 on ℓ̌_{H₁}; apply T3/subgroup-lifting to ker F^m ⊂ A₁[p^m].
- (1) Uniqueness and points: if C, C′ are both ≡ ker F^m mod p^{1−ε}, the universal point of C maps to a point of A[p^m]/C′ vanishing mod p^{1−ε}, and Ω¹ of A[p^m]/C′ is killed by p^ε < p^{1−ε}, so T3/section-rigidity gives C ⊂ C′.
- (2) Use FAR11 Theorem 4 for level-one existence, degree, Frobenius congruence and character-kernel identification, with the stated HN/degree/cokernel and Oort–Tate inputs. For n≥2 let D⊂G[p] be that level-one subgroup. T3/pointwise-quotient-hasse gives Ha(p^{−1}D/D)=pw; R07.1 supplies the level-(n−1) BT quotient p^{−(n−1)}D/D. Apply induction to this quotient and take the inverse image of its canonical subgroup. HN/degree inequalities identify the resulting height-nd break (FAR11 Theorem 6, PDF pp.38–39). The later family quotient-radius theorem is not a prerequisite.

**Acceptance instances.**

- For E ordinary, C₁ = E[p]^0 = μ_p étale-locally and ker α_{E[p]} = E[p]^0(O_C).
- For E with Ha(E) = 1/4 and p ≥ 5, deg C₁ = 3/4.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T3/subgroup-lifting`
- `HodgeTateAndCanonicalSubgroups:T3/section-rigidity`
- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup`
- `HodgeTateAndCanonicalSubgroups:T0/finite-hodge-tate-map`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-hodge-tate-cokernel`
- `HodgeTateAndCanonicalSubgroups:T0/harder-narasimhan-filtration`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree-properties`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree-generic-isomorphism`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/oort-tate-classification`
- `HodgeTateAndCanonicalSubgroups:T3/pointwise-quotient-hasse`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`

**Source matches.**

- SCH15, §3.2.1, Corollary 3.2.6, p. 33 (arXiv v2): Corollary 3.2.6: existence and uniqueness.
- SCH15, §3.2.1, proof of Corollary 3.2.6, p. 33: Existence through the lifting corollary.
- FAR11, §7.5, Théorème 6, PDF pp.38–39: Fargues's main theorem, p ≠ 2.
- FAR11, §7.5, Théorème 6 (7), PDF pp.38–39: Hodge–Tate characterisation.
- FAR11, §6.5, Théorème 4, PDF p. 32: Degree of the quotient at level 1.

### T3/canonical-subgroup-properties — Levels, functoriality, duality and generic points of canonical subgroups

**Theorem** · proposed name `TauCeti.HodgeTate.canonicalSubgroup_properties` · implementation unchecked.

Let R be a p-adically complete flat ℤ_p^cycl-algebra and A, B abelian schemes over R; canonical means strong (T3/canonical-subgroup). (i) If A has a canonical subgroup C_m of level m, it has one of every level m′ ≤ m, and C_{m′} = C_m[p^{m′}] ⊂ C_m. (ii) If f: A → B is a homomorphism and both have canonical subgroups of level m, then f(C_m) ⊂ D_m; in particular C_m is stable under endomorphisms (e.g. an 𝒪_F-action). (iii) For a principal polarisation λ, C_m is maximal totally isotropic for the Weil pairing on A[p^m], and pointwise C_m(O_C)^⊥ ⊂ A^∨[p^m](O_C) is the canonical subgroup of A^∨ at every rank-one point (p ≠ 2: Fargues 2011, Proposition 11 and Corollaire 1). (iv) If x̄ is a geometric point of Spec R[1/p], C_m(x̄) ≅ (ℤ/p^m)^g. (v) Formation of C_m commutes with base change R → R′.

**Hypotheses.**

- (iv) needs the strong condition (Ha^{p^m} | p^ε, ε < 1/2); for m = 1 the weak subgroup already has (ℤ/p)^g geometric points since it has order p^g and is killed by p.
- The printed proofs of (i)–(ii) use the incorrect equality of Corollary 3.2.6 (PAPER-SCHOLZE-15/E17); the packet proves them through T3/section-rigidity.
- The duality statement over families: totally isotropic by uniqueness (the orthogonal of C_m also satisfies the defining congruence).

**Proof route.**

- (i), (ii), (v): uniqueness in T3/canonical-subgroup-theorem (1) applied to C_m[p^{m′}], f(C_m) and the base change, each of which satisfies the defining congruence modulo p^{1−ε}, via T3/section-rigidity.
- (iii): ker F^m is totally isotropic mod p^{1−ε}, so C_m^⊥ satisfies the defining congruence of the canonical subgroup and equals C_m by uniqueness; pointwise duality from Fargues 2011 Proposition 11.
- (iv): reduce to R = O_K with K algebraically closed (open-and-closed locus and specialisation); if C_m(K) ≇ (ℤ/p^m)^g there is s ∈ C_m ∩ A[p] outside C₁, whose image t in A[p]/C₁ is ≡ 0 mod p^{(1−ε)/p^m}; T3/section-rigidity with δ = (1 − ε)/p^m > ε/p^m gives t = 0, a contradiction.

**Acceptance instances.**

- For A ordinary, C_m = A[p^m]^0 and C_m(x̄) = μ_{p^m}^g(x̄) ≅ (ℤ/p^m)^g.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-theorem`
- `HodgeTateAndCanonicalSubgroups:T3/section-rigidity`
- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup`
- `AbelianSchemesAndArithmeticModuli:A3`

**Source matches.**

- SCH15, §3.2.1, Proposition 3.2.8(i), p. 34 (arXiv v2): Proposition 3.2.8(i).
- SCH15, §3.2.1, Proposition 3.2.8(ii), p. 34: Proposition 3.2.8(ii).
- SCH15, §3.2.1, Proposition 3.2.8(iv), p. 34: Proposition 3.2.8(iv).

### T3/quotient-hasse-radius — Quotients by canonical and anticanonical subgroups and the Hasse radius

**Theorem** · proposed name `TauCeti.HodgeTate.quotientHasseRadius` · implementation unchecked.

(1) Let A/R have a canonical subgroup C_{m₁} of level m₁ (radius ε < 1/2). Then Ha(A/C_{m₁}) = Ha(A)^{p^{m₁}} modulo p^{1−ε}, and B := A/C_{m₁} has a canonical subgroup D_{m₂} of level m₂ iff A has one of level m = m₁ + m₂; then 0 → C_{m₁} → C_m → D_{m₂} → 0 is exact and compatible with 0 → C_{m₁} → A → B → 0. (2) (Points, p ≠ 2.) For a BT₂ G over O_C with Ha(G) < 1/(p+1) and C its canonical subgroup of level 1, Ha(p^{-1}C/C) = p·Ha(G); if 1/(p+1) ≤ Ha(G) < 1/2 then Ha(p^{-1}C/C) ≥ 1 − Ha(G). (3) (Anticanonical quotients.) If A′ has a weak canonical subgroup C′ of level 1 on 𝔛(ε), ε < 1/2, and D ⊂ A′[p] is a subgroup of order p^g with D ∩ C′ = 0, then A′/D has Hasse valuation Ha(A′)/p, and (A′/D)/(A′[p]/D) ≅ A′: dividing by a canonical subgroup multiplies the Hasse radius by p, dividing by an anticanonical subgroup divides it by p.

**Hypotheses.**

- (1) needs the strong condition at level m₁; the exactness in (1) also uses p^{m₂}C_m ⊂ C_{m₁}, proved by the same congruence argument (not written in Scholze's proof).
- (3) is the content of Scholze's Theorem 3.2.15(iii): 𝒳(p^{-1}ε) ≅ 𝒳_{Γ₀(p)}(ε)_a by A ↦ (A/C, A[p]/C).

**Proof route.**

- (1): modulo p^{1−ε}, A/C_{m₁} = A/ker F^{m₁} = A^{(p^{m₁})}, whose Hasse invariant is Ha(A)^{p^{m₁}}; the exact sequence by uniqueness and T3/section-rigidity, using 0 → ker F^{m₁}_A → ker F^m_A → ker F^{m₂}_B → 0 mod p^{1−ε}.
- (2) Apply T3/pointwise-quotient-hasse to the canonical level-one subgroup supplied by the main theorem and its Frobenius congruence.
- (3): for A with |Ha| ≥ |p|^{ε/p}, A′ = A/C has radius ε by (1), and D = A[p]/C meets the weak canonical subgroup of A′ trivially (T3/section-rigidity); conversely A′/D ≅ A.

**Acceptance instances.**

- For ordinary E over O_C, E/E[p]^0 is ordinary. Its special-fibre quotient is the Frobenius twist; no mixed-characteristic Frobenius-twist isomorphism is asserted.
- For p≥5 and Ha(E)=1/(2p), Ha(E/C₁)=1/2 and Ha(E/D)=1/(2p²) for an anticanonical D.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-theorem`
- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-properties`
- `HodgeTateAndCanonicalSubgroups:T3/section-rigidity`
- `HodgeTateAndCanonicalSubgroups:T3/pointwise-quotient-hasse`

**Source matches.**

- SCH15, §3.2.1, proof of Proposition 3.2.8(iii), p. 34 (arXiv v2): Hasse invariant of the quotient by the canonical subgroup.
- FAR11, §7.4, Théorème 5, PDF p. 37: Fargues's Théorème 5.
- SCH15, §3.2.2, Theorem 3.2.15(iii), p. 40 (arXiv v2): Anticanonical subgroups and the radius change.
- AIP15, §6.2.1, Proposition 6.2.1.1, PDF p.29 (arXiv:1212.3812v1; auxiliary p>2 range): Dividing by an anticanonical subgroup divides the Hodge height by p.

### T3/canonical-subgroup-hodge-tate — The Hodge–Tate map of the dual canonical subgroup

**Theorem** · proposed name `TauCeti.HodgeTate.canonicalSubgroup_hodgeTate` · planet **Hodge–Tate map of the canonical subgroup** · implementation unchecked.

Let C/ℚ_p be complete algebraically closed, G/O_C p-divisible of dimension d, and n≥1. In the strict FAR11/AIP15 range for p≥3, or in the HALO range w≤p^{−(n+1)} for every p, let H_n be canonical, w the Hodge height and δ=S_n w. Then ω_{G[p^n]}/p^{n−δ}≅ω_{H_n}/p^{n−δ}. The character map H_n^D(C)⊗O_C→ω_{H_n} has cokernel of valuation degree w/(p−1). Its determinant ideal Hdg_T satisfies Hdg_T^{p−1}=Hdg, and its cokernel is killed by Hdg_T. In the FAR11 range H_n(O_C) is the kernel of α_G truncated at n−δ; HALO Proposition A.2 gives the level-one kernel in its own hypotheses. In normal formal families with trivialized dual canonical points, the determinant-ideal and annihilator statements hold on the AIPH/HALO models; analytic O⁺ transfer is a separate R2 contract. The modified-lattice quotient isomorphism is T5’s result, not a raw integral Hodge–Tate isomorphism.

**Hypotheses.**

- For p≥5 the FAR11 HN range is w<1/(2p^{n−1}); for p=3 it is w<1/3^n. Keep these strict inequalities separate from BHW’s larger inclusive position target.
- For p=2 the required uniform radius is w≤1/2^{n+1}; HALO Corollary A.2 and Proposition A.3 replace the excluded p=2 FAR11 theorem.
- Formal determinant ideals require a normal admissible torsion-free base, an invertible Hodge ideal, and the trivialized generic dual quotient of HALO Proposition A.3. Fractional powers mean powers of this Hdg_T ideal, not arbitrary formal real powers.

**Proof route.**

- For p≥3 use AIP15 Proposition 3.2.1 for the truncated conormal isomorphism and the raw character-cokernel defect; use FAR11 Theorem 6 for its kernel characterization in the strict HN range.
- For p=2 use HALO Corollary A.2(4) for conormal annihilators and Proposition A.3 for Hdg_T^{p−1}=Hdg; iterate the compatible quotients to level n. The p=2 weak lift uses S_n/2^{n+1}<1/2.
- HALO’s determinant argument reduces on normal models to FAR11 Proposition 7: the semilinear fixed-vector matrix has determinant valuation w/(p−1), and its adjugate gives the annihilator. At p=2 the needed w≤1/4 is inside the matrix lemma’s strict w<1/2 range.
- Transfer these explicit generator matrices and quotient isomorphisms through the supplied integral generic-fibre functor; local freeness is not inferred from normality and pointwise ranks.

**Acceptance instances.**

- For A ordinary (w = 0), C_n = A[p^n]^0, C_n^D is étale and α identifies (C_n^D)(O_C) ⊗ O_C/p^n with ω_A/p^n (T0/multiplicative-hodge-tate-isomorphism).

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-theorem`
- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-properties`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-hodge-tate-cokernel`
- `HodgeTateAndCanonicalSubgroups:T0/multiplicative-hodge-tate-isomorphism`
- `HodgeTateAndCanonicalSubgroups:T0/finite-hodge-tate-map`
- `HodgeTateAndCanonicalSubgroups:T0/conormal-right-exact`
- `AdicSpacesPartII:R2`
- `HilbertModularVarietiesAndShimuraCurves:H2`

**Source matches.**

- AIP15, §3.2, Proposition 3.2.1, PDF pp.12–13 (arXiv:1212.3812v1): Provides the truncated conormal comparison and the positive raw Hodge–Tate cokernel defect.
- FAR11, Proposition 7, PDF pp. 27–29; Théorème 6, PDF pp.38–39: The fixed-vector determinant calculation and the strict-range HN kernel theorem.
- HALO, Appendix A.2, Corollary A.2(4); A.3, Propositions A.2–A.3, PDF pp. 39–41: Supplies the all-prime formal canonical construction and determinant ideal, including the p=2 range.

### T3/hilbert-canonical-subgroup — Canonical subgroups of Hilbert–Blumenthal abelian schemes at arbitrary p

**Theorem** · proposed name `TauCeti.HodgeTate.hilbertCanonicalSubgroup` · planet **Hilbert canonical subgroup** · implementation unchecked.

For a HBAV A/R on the specified normal admissible Deligne–Pappas/Rapoport Hilbert model, with total Hasse height w≤ε≤p^{−(n+1)}, a level-n canonical subgroup H_n exists for every p, has integral finite locally free rank p^{ng}, is O_F-stable, and its geometric generic points are locally free rank one over O_F/p^n. The dual canonical generic module has the corresponding invertible O_F/p^n type via the polarization ideal. The last freeness assertion uses the Hilbert canonical-module theorem, not merely O_F stability and a ℤ/p^n rank count; its ramified-generator proof is explicitly requested from H2/H4. Integral H_n may be multiplicative and is not identified with a constant group.

**Hypotheses.**

- R is on the normal admissible Hilbert formal model where the total Hasse ideal is invertible and the HALO/AIPH construction applies. A general arbitrary R with the same numerical rank is insufficient.
- The small-prime endpoint is allowed: S_n ε≤(p^n−1)/((p−1)p^{n+1})<1/2 even for p=2. The stronger p^nε<1/2 proof is not used at its p=2 equality.
- The exact unsplit O_F/p^n generator theorem and polarization-ideal type over ramified p are required supplier inputs.

**Proof route.**

- Apply HALO Corollary A.2 to p∈Hdg^{p^{n+1}}; alternatively apply the weak subgroup lifting condition using the displayed strictly smaller than 1/2 value S_nε.
- Functorial uniqueness gives O_F stability. Frobenius reduction gives integral rank p^{ng}; HALO gives the geometric ℤ/p^n type.
- Import the Hilbert canonical-module/dual-type theorem from H2/H4 on these formal charts, including its ramified generator. This is the substantive step that upgrades ℤ/p^n type to O_F/p^n freeness.

**Acceptance instances.**

- For F = ℚ, C_n ⊂ E[p^n] is the classical canonical subgroup of the modular curve, cyclic of order p^n on geometric generic points.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup`
- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-theorem`
- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-properties`
- `HodgeTateAndCanonicalSubgroups:T3/hasse-neighbourhood`
- `HilbertModularVarietiesAndShimuraCurves:H2`
- `ShimuraCompactifications:C6/hilbert-near-ordinary-model`
- `HilbertModularVarietiesAndShimuraCurves:H4`

**Source matches.**

- BHW, §5.2, PDF pp. 21–23; §7.1, PDF p. 29: Uses the total-Hasse canonical subgroup and the Hilbert dual generator.
- HALO, Appendix A.2, Corollary A.2(1)–(6), PDF pp. 39–40: Gives existence, nesting, quotient, duality and geometric generic ℤ/p^n type at every prime.
- AIPH, §3, Propositions 3.2–3.3, PDF p.11 (Hilbert_adicfinal.pdf): The Hilbert formal setting and O_F-linear generator enter the integral lattice construction.

**Coverage: planned.**

- Group co-Lie deformation and trace duality: R07.6 owns the finite-flat group specialization of DD.0’s full cotangent and obstruction theory, syntomic determinant and trace duality. Read FAR10 §1–§2, SCH15 III.2.2 and HALO A.1 give the consequences used here; Illusie II is not cleared and its foundation is not independently verified. The Fitting definition of degree does not remove this lifting input.
- Inclusive geometric endpoint and ramified canonical generator: HALO Appendix A independently covers p=2 and the small all-prime formal radius, including the strict weak-bound inequality at its endpoint. The larger BHW pointwise radius still needs its p≥3 inclusive-endpoint refinement and exact unsplit O_F/p^n dual generator from H2/H4. The scalar kernel/degree argument and generic projection are separated; neither stability nor a generic decomposition proves integral O_F freeness.
- Siegel consumer domain refinement: The OverconvergentAutomorphicForms O8 request for the p>2g Siegel DRW §3.6 domain comparison needs its source read and exact comparison hypothesis. The present nodes cover the assigned general canonical and period-position targets; this additional consumer refinement is not established.

## T4 — The pointwise loci and scaled finite Atkin–Lehner maps lead to kernel coordinates and integral-closure balls. The scalar kernel lemma precedes the ramified projection lemma, which precedes the numerical period inclusion; the old logical cycle is removed.

### T4/canonical-anticanonical-loci — Canonical and anticanonical loci at Γ₀(p^n)-level

**Definition** · proposed name `TauCeti.HodgeTate.canonicalLocus` · planet **Canonical and anticanonical loci** · implementation unchecked.

Let X be the Siegel, Hilbert or PEL Shimura variety at prime-to-p level with Hasse neighbourhoods X(ε) (T3/hasse-neighbourhood), ε small enough that the universal (semi-)abelian scheme A over X(ε) has a weak canonical subgroup C ⊂ A[p] of level 1 and, where needed, a canonical subgroup C_n of level n (T3/canonical-subgroup). Let X_{Γ₀(p^n)} parametrise (A, D) with D ⊂ A[p^n] a totally isotropic (𝒪_F-stable, for Hilbert data locally free of rank one over 𝒪_F/p^n on geometric points) subgroup of the appropriate order, and X_{Γ₀(p^n)}(ε) the preimage of X(ε) under (A, D) ↦ A. The canonical locus X_{Γ₀(p^n)}(ε)_c is the open and closed subspace where D = C_n; the anticanonical locus X_{Γ₀(p^n)}(ε)_a is the open and closed subspace where D[p] ∩ C = 0. Both are defined on generic fibres by these subgroup conditions, and on formal models through the integral C_n and the schematic closure of D.

**Hypotheses.**

- Hilbert data: X_{Γ₀*(p^n)} with BHW's level structure Φ_n: C ↪ A^∨[p^n] étale locally isomorphic to 𝒪_F/p^n (the dual abelian variety carries the level structure in BHW's convention).
- The canonical locus needs a canonical subgroup of level n, i.e. ε within the radius of T3/hilbert-canonical-subgroup or T3/canonical-subgroup-theorem; the anticanonical locus only needs the level-1 weak canonical subgroup.

**Proof route.**

- Openness and closedness: the conditions D = C_n and D[p] ∩ C = 0 are open and closed on the finite étale cover X_{Γ₀(p^n)}(ε) → X(ε) (comparison of finite étale subgroups).
- For the Siegel case these loci and their open immersions are PerfectoidShimuraVarieties S1/anticanonical-open-immersions and S1/anticanonical-locus-level-p; this node gives the general definition they use.

**Acceptance instances.**

- For the modular curve and n = 1, X_{Γ₀(p)}(ε) = X_{Γ₀(p)}(ε)_c ⊔ X_{Γ₀(p)}(ε)_a for ε < p/(p+1).

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup`
- `HodgeTateAndCanonicalSubgroups:T3/hilbert-canonical-subgroup`
- `HodgeTateAndCanonicalSubgroups:T3/hasse-neighbourhood`
- `HilbertModularVarietiesAndShimuraCurves:H4`
- `PELModuli:M1/level-structure`

**Source matches.**

- BHW, §5.2 (arXiv:1902.03985v4), PDF p. 21: BHW: the anticanonical locus parametrises subgroups meeting the canonical subgroup trivially.
- SCH15, §3.2.2, Theorem 3.2.15(iii), p. 40 (arXiv v2): Scholze's anticanonical locus at level Γ₀(p).

**Uses.**

- Scholze 2015, Theorem 3.2.15: anticanonical open immersions (PerfectoidShimuraVarieties S1)
- BHW 2019, §5.2, Theorem 5.11: the anticanonical tower is perfectoid
- OverconvergentAutomorphicForms:O2: domains of overconvergent Hilbert forms

**Planning API.**

- `TauCeti.HodgeTate.canonicalLocus` (constructor): X_{Γ₀(p^n)}(ε)_c = {(A, D) : D = C_n}.
- `TauCeti.HodgeTate.anticanonicalLocus` (constructor): X_{Γ₀(p^n)}(ε)_a = {(A, D) : D[p] ∩ C = 0}.
- `TauCeti.HodgeTate.anticanonicalLocus_isClopen` (characterisation): Both loci are open and closed in X_{Γ₀(p^n)}(ε).
- `TauCeti.HodgeTate.anticanonicalLocus_forget` (functoriality): The forgetful maps X_{Γ₀(p^{n+1})}(ε)_a → X_{Γ₀(p^n)}(ε)_a, (A, D) ↦ (A, D[p^n]), give the anticanonical tower.
- `TauCeti.HodgeTate.canonicalLocus_section` (relation): X(ε) → X_{Γ₀(p^n)}(ε)_c, A ↦ (A, C_n), is an isomorphism (T4/canonical-locus-isomorphism).

**Mathematical tests.**

- `TauCeti.HodgeTate.anticanonicalLocus_ordinary` (degenerate): On the ordinary locus, D is a complement to the connected multiplicative part A[p^n]^0 and is étale-locally (ℤ/p^n)^g. Many complements may exist; D is not asserted equal to a previously chosen complement.
- `TauCeti.HodgeTate.canonicalLocus_modularCurve` (computation): For the modular curve and n = 1 the two loci partition X_{Γ₀(p)}(ε) into the canonical component (degree 1 over X(ε)) and the anticanonical component (degree p over X(ε)).
- `TauCeti.HodgeTate.anticanonicalLocus_not_complement` (non-example): For Hilbert data with several primes above p, 'D different from C' is not 'D ∩ C = 0': the anticanonical condition must be imposed at every prime above p.

### T4/canonical-locus-isomorphism — The canonical locus is a section of the Γ₀(p^n)-cover

**Theorem** · proposed name `TauCeti.HodgeTate.canonicalLocus_isomorphism` · implementation unchecked.

In the situation of T4/canonical-anticanonical-loci, A ↦ (A, C_n) defines an isomorphism X(ε) ≅ X_{Γ₀(p^n)}(ε)_c of adic spaces, inverse to the forgetful map; it is compatible with the forgetful maps in n, with prime-to-p Hecke correspondences and with base change.

**Hypotheses.**

- ε within the radius of existence of the strong canonical subgroup of level n.
- A formal-model version additionally needs the common compatible normalization/model identification requested from R2; the adic finite-étale section argument alone does not establish it.

**Proof route.**

- C_n is totally isotropic and (for Hilbert data) 𝒪_F-stable of the right type (T3/canonical-subgroup-properties), so A ↦ (A, C_n) is a section of the finite étale map X_{Γ₀(p^n)}(ε) → X(ε) landing in the canonical locus.
- A section of a finite étale map is an open and closed immersion; its image is X_{Γ₀(p^n)}(ε)_c by uniqueness of C_n.

**Acceptance instances.**

- For the modular curve, X_{Γ₀(p)}(ε)_c → X(ε) has degree 1.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci`
- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-properties`
- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-theorem`
- `AdicSpacesPartII:R2`

**Source matches.**

- SCH15, §3.2.2, Theorem 3.2.15(ii), p. 39 (arXiv v2): The canonical subgroup gives maps to Γ₀(p^m)-level.

### T4/atkin-lehner-anticanonical — Atkin–Lehner identifies the anticanonical locus with a smaller Hasse neighbourhood

**Theorem** · proposed name `TauCeti.HodgeTate.atkinLehner_anticanonical` · planet **Atkin–Lehner and the anticanonical tower** · implementation unchecked.

For n ≥ 1, ε ≥ 0 and ambient radius δ = p^nε < 1/2 in the Siegel case (in the Hilbert case require the corresponding canonical-subgroup range at each quotient step), the map AL_n: X_{Γ₀(p^n)}(p^nε)_a → X(ε), (A, D) ↦ A/D, is an isomorphism; its inverse sends B ∈ X(ε) to (B/C_n(B), B[p^n]/C_n(B)) up to the identification (B/C_n)/(B[p^n]/C_n) ≅ B. Equivalently X(p^{−n}ε) ≅ X_{Γ₀(p^n)}(ε)_a by A ↦ (A/C_n, A[p^n]/C_n). Under these isomorphisms the anticanonical tower … → X_{Γ₀(p^{n+1})}(ε)_a → X_{Γ₀(p^n)}(ε)_a corresponds to the Frobenius tower … → X(p^{−n−1}ε) → X(p^{−n}ε) given by division by the canonical subgroup of level 1, which reduces to the relative Frobenius modulo p^{1−δ}, δ = ((p+1)/p)ε. The radius changes by the factor p^n: dividing by C_n multiplies the Hasse valuation by p^n, dividing by an anticanonical subgroup divides it by p^n (T3/quotient-hasse-radius).

**Hypotheses.**

- The Hilbert statement uses the total Hasse invariant; the Siegel statement is Scholze's Theorem 3.2.15(ii)–(iii) (whose open immersions are PerfectoidShimuraVarieties S1's); this node is the radius bookkeeping both use.
- BHW use the radius change p^nε ↔ ε for AL_n without separate proof; it is the inverse of T3/quotient-hasse-radius (1) iterated.
- In the equivalent formulation use ambient δ: AL_n: X_{Γ₀(p^n)}(δ)_a ≅ X(p^{−n}δ). A bound only on ε, with no control of p^nε, is insufficient.

**Proof route.**

- A ↦ (A/C_n, A[p^n]/C_n) is well defined on X(p^{−n}ε) by T3/quotient-hasse-radius (1): A/C_n has radius ε; A[p^n]/C_n meets the canonical subgroup of A/C_n trivially (T3/quotient-hasse-radius (3)).
- The inverse is (A′, D) ↦ A′/D; composition is the identity since (A/C_n)/(A[p^n]/C_n) = A/A[p^n] ≅ A.
- Frobenius tower: T3/quotient-hasse-radius (1) at level 1 and the congruence C₁ ≡ ker F.

**Acceptance instances.**

- For the modular curve and pε < 1/2, AL₁: X_{Γ₀(p)}(pε)_a ≅ X(ε) is the restricted Atkin–Lehner map.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci`
- `HodgeTateAndCanonicalSubgroups:T3/quotient-hasse-radius`
- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-properties`

**Source matches.**

- BHW, §5.2, proof of Theorem 5.11 (arXiv:1902.03985v4), PDF p. 22: BHW: Atkin–Lehner isomorphisms identify the anticanonical tower with the Frobenius tower.
- SCH15, §3.2.2, after the proof of Theorem 3.2.15, p. 41 (arXiv v2): Scholze's description of the anticanonical locus as the image of X(p^{-m}ε).

### T4/hodge-tate-coordinate — The Hodge–Tate coordinate, the fractional-linear action and the factor cz + d

**Definition** · proposed name `TauCeti.HodgeTate.hodgeTateCoordinate` · implementation unchecked.

Let 𝒪_p = 𝒪_F ⊗ ℤ_p and Fl = Res_{F/ℚ}ℙ¹. Fix BHW’s kernel-line convention: π_HT(A,α) is the kernel of the quotient 𝒪_p² ⊗ C → ω_A. On the chart where HT(α(e₁)) generates, this kernel has coordinates (z:1), with z = −HT(α(e₂))/HT(α(e₁)). Convert the tower’s right action explicitly to the left fractional-linear action z(γx) = (az+b)/(cz+d), and set j(γ,x) = cz+d. On chart intersections where denominators are invertible, j(γδ,x) = j(γ,δx)j(δ,x). The associated quotient-line action is det(γ)^{−1}γ; its pullback uses γ^∨ = det(γ)γ^{−1}. Thus the section given by the class of e₁ transforms by cz+d (BHW Lemma 3.19). Unit and analytic structure-group assertions on anticanonical domains require the period estimates of T4/period-map-inclusions; they are not true at every point of the affine chart. After splitting F these formulas hold componentwise and descend on the generic fibre. Integral descent uses the chosen O⁺-lattice, not an identification of the ramified order with its normalisation.

**Hypotheses.**

- The coordinate formula is asserted on chart intersections with invertible denominator.
- For Γ₀(p) on the anticanonical domain the unit estimate uses T4’s period position. Membership in the actual AIP group B_m is T5/aip-automorphy-factor, using the ratio of two lifts in the same torsor; it is not deduced from an ambient radius inclusion.

**Proof route.**

- Represent the quotient by the functional (HT(e₁),HT(e₂)); its kernel generator on this chart is (−HT(e₂)/HT(e₁),1).
- Multiply the two matrices to prove the fractional-linear cocycle where the denominator is a unit. The derivative is det(γ)/(cz+d)², not j.
- Compute the pullback action of γ^∨ on the class of e₁ modulo the kernel line: γ^∨e₁ = (d,−c) ≡ (cz+d)e₁, as in BHW Lemma 3.19.
- Split the generic coefficient algebra to check the formulas, then descend; integral unit bounds require the period-domain estimates and are a recorded gap.

**Acceptance instances.**

- For F = ℚ and γ = (1 0; c 1), z(γx) = z/(cz + 1).

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T2/hodge-tate-flag-point`
- `ShimuraData:D3/compact-dual`
- `mathlib:Module.Grassmannian`
- `HilbertModularVarietiesAndShimuraCurves:H4`
- `HodgeTateAndCanonicalSubgroups:T2/open-tower-hodge-tate-map`

**Source matches.**

- BHW, §2, Definition 2.3 (arXiv:1902.03985v4), PDF p. 8: BHW: the parameter z on ℙ¹.
- BHW, §3.3, Lemma 3.19 (arXiv:1902.03985v4), PDF p. 13: BHW Lemma 3.19: the factor cz + d.

**Uses.**

- BHW 2019, §§3, 5, 7: overconvergent weights κ(cz + d) define the automorphy factor
- OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor: the Hilbert automorphy factor and cocycle law
- HodgeTateAndCanonicalSubgroups:T5/aip-hodge-tate-comparison: s equivariant for cz + d

**Planning API.**

- `TauCeti.HodgeTate.hodgeTateCoordinate` (constructor): On the kernel-line chart (z:1), z = −HT(α(e₂))/HT(α(e₁)); HT(α(e₁)) is the quotient-line generator.
- `TauCeti.HodgeTate.fractionalLinear_action` (functoriality): For the specified left action, z(γx) = (az+b)/(cz+d) on the domain where cz+d is invertible.
- `TauCeti.HodgeTate.automorphyFactor` (constructor): j(γ, x) := cz(x) + d.
- `TauCeti.HodgeTate.automorphyFactor_cocycle` (relation): j(γδ,x) = j(γ,δx)j(δ,x) on common affine-chart domains with invertible denominators.
- `TauCeti.HodgeTate.automorphyFactor_unit` (relation): For γ ∈ Γ₀(p), j(γ,x) is an O⁺-unit on the anticanonical period domains satisfying T4/period-map-inclusions; this uses that the coordinates are within radius < 1 of 𝒪_p.
- `TauCeti.HodgeTate.hodgeTateCoordinate_descent` (compatibility): After splitting F, z = (z_σ)_σ and the generic formulas descend over F ⊗ ℚ_p. Integral descent requires the specified O⁺-lattice, not the false ramified product identification.

**Mathematical tests.**

- `TauCeti.HodgeTate.automorphyFactor_identity` (degenerate): j(1, x) = 1.
- `TauCeti.HodgeTate.fractionalLinear_upperTriangular` (computation): For γ = (a b; 0 d), z(γx) = (a z(x) + b)/d.
- `TauCeti.HodgeTate.automorphyFactor_cocycle_test` (characterisation): For γ = (1 0; c 1), δ = (1 0; c′ 1): j(γδ, x) = (c + c′)z + 1 = j(γ, δx)·j(δ, x).
- `TauCeti.HodgeTate.automorphyFactor_not_rightAction` (non-example): With the right action x·γ the factor is cz + d for γ^{-1}, not for γ: the cocycle law fails for the naive formula j(γ, x) = cz + d with z(xγ) = (az + b)/(cz + d).

### T4/flag-variety-balls — Balls around the integral points of the Hilbert flag variety

**Definition** · proposed name `TauCeti.HodgeTate.flagBall` · implementation unchecked.

For L a complete extension of ℚ_p, r ∈ (0, 1] ∩ |L^×| and x ∈ Res_{𝒪_F/ℤ}𝔾_a(𝒪_p), the ball B_r(x) := x + t·Res_{𝒪_F/ℤ}𝔾̂_a with |t| = r is an open affinoid subspace of Res_{𝒪_F/ℤ}ℙ¹ over L; B_0(𝒪_p : 1) := 𝒪_p ⊂ ℙ¹(𝒪_p) via a ↦ (a : 1), and B_r(𝒪_p : 1) is the union of the balls of radius r around the points of 𝒪_p; analogously B_r(𝒪_p^× : 1) and B_r(1 : p𝒪_p) (around the points (1 : pb)). On C-points, B_r(𝒪_p : 1)(C) = 𝒪_p + t·(𝒪_p ⊗ O_C)^∼ inside 𝒪_p ⊗ C, where (𝒪_p ⊗ O_C)^∼ denotes the integral closure (BHW's convention), so the definition is meaningful for p ramified in F.

**Hypotheses.**

- The integral structure Res 𝔾̂_a(C) = (𝒪_p ⊗ O_C)^∼ is the integral closure of 𝒪_F ⊗ O_C in F ⊗ C = C^Σ; for p unramified this is 𝒪_p ⊗ O_C itself.

**Proof route.**

- Define the balls as images of the closed unit polydisc under affine maps over L, glued for the finitely many cosets of t𝒪_p in 𝒪_p (Res 𝔾̂_a is a product of discs after splitting).
- For r < 1, Γ₀(p) preserves these two neighbourhoods using the two affine charts and unit denominators. Do not assert that all GL₂(𝒪_p) permutes affine balls, or that Γ₀(p) preserves the second ball for r = 1.

**Acceptance instances.**

- For F = ℚ, B_r(ℤ_p : 1) = {z : |z − a| ≤ r for some a ∈ ℤ_p}.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate`
- `AdicSpacesPartII:R2/generic-fibre-functor-d`
- `tauceti:TauCeti.Huber.Pair`

**Source matches.**

- BHW, §5.3, Definition 5.17, PDF p. 24 (arXiv:1902.03985v4): The balls B_r(𝒪_p^× : 1) and B_r(1 : p𝒪_p).

**Uses.**

- BHW 2019, Proposition 5.18: images of the canonical and anticanonical loci under π_HT
- OverconvergentAutomorphicForms:O2: evaluation of locally analytic weights on cz + d

**Planning API.**

- `TauCeti.HodgeTate.flagBall` (constructor): B_r(x) = x + t·Res 𝔾̂_a, |t| = r.
- `TauCeti.HodgeTate.integralBall` (constructor): B_r(𝒪_p : 1), B_r(𝒪_p^× : 1), B_r(1 : p𝒪_p) as unions of balls.
- `TauCeti.HodgeTate.integralBall_points` (characterisation): B_r(𝒪_p : 1)(C) = 𝒪_p + t(𝒪_p ⊗ O_C)^∼.
- `TauCeti.HodgeTate.integralBall_mono` (relation): B_r ⊂ B_{r′} for r ≤ r′.
- `TauCeti.HodgeTate.integralBall_gamma0` (functoriality): For 0 ≤ r < 1, Γ₀(p) preserves B_r(𝒪_p:1) and B_r(1:p𝒪_p). The r = 1 assertion for the second chart is excluded.

**Mathematical tests.**

- `TauCeti.HodgeTate.integralBall_one` (degenerate): B_1(ℤ_p : 1) is the closed unit disc {|z| ≤ 1} for F = ℚ.
- `TauCeti.HodgeTate.integralBall_disjoint` (computation): For F = ℚ and r < 1, B_r(ℤ_p : 1) and B_r(1 : pℤ_p) are disjoint.
- `TauCeti.HodgeTate.integralBall_ramified` (non-example): For p ramified in F, 𝒪_p ⊗ O_C is not the integral closure: B_r must be defined with the integral closure, or the ball misses points of 𝒪_p ⊗ C of norm ≤ r.

### T4/period-map-inclusions — Hodge–Tate images of the canonical and anticanonical loci (BHW Proposition 5.18)

**Theorem** · proposed name `TauCeti.HodgeTate.periodMap_inclusions` · planet **Hodge–Tate period estimates (BHW Prop. 5.18)** · implementation unchecked.

Let 1 > r > 0, m ≥ 1 with p^{−m} ≤ r, and 0 ≤ ε ≤ 1/(c_p p^m) with c_p = 2 for p ≥ 5, c_p = 3 for p = 3, c_p = 4 for p = 2. Then π_HT(X_{Γ(p^∞)}(ε)_c) ⊂ B_r(1 : p𝒪_p) and π_HT(X_{Γ(p^∞)}(ε)_a) ⊂ B_r(𝒪_p : 1). More precisely, with n = m + 1 and x = n − p^nε/(p−1), every point of the anticanonical locus has π_HT ∈ B_{|p^x|}(𝒪_p : 1). The same ε serves all primes above p. The inequalities are exactly what is needed to evaluate a locally analytic weight on cz + d.

**Hypotheses.**

- The open-locus value inclusions use T2’s map. Boundary charts use the relative full one-motive flag and estimates supplied by T0/C4; whenever S3’s compactified map has been constructed, these yield the identical value inclusions for its extension. A global S3 map is not a prerequisite for the open estimate or local boundary calculation.
- At the BHW inclusive endpoints, supply the canonical conormal/kernel estimates stated in Proposition 5.19. FAR11’s strict HN bound alone does not cover equality for p≥3; this is recorded as a numerical supplier refinement.
- For boundary points require the compatible full dual one-motive estimates. The finite-height Raynaud Tate group by itself does not give a rank-2g coordinate frame.

**Proof route.**

- Use the supplied level-n canonical subgroup and character estimates with n=m+1; apply T4/canonical-kernel-congruence to obtain precision x=n−p^nw/(p−1).
- For the anticanonical full-level frame the canonical generic module has a unit second coordinate in every local factor; for the canonical frame it has a unit first coordinate. Its unsplit O_F/p^n generator is the Hilbert supplier theorem.
- Apply the projection argument of T4/ramified-period-comparison: scalar O_C congruences give each generic embedding coordinate within p^x of the integral center, using the integral closure for the ball.
- The inequalities give p^nε/(p−1)≤p/(c_p(p−1))<1, hence x>m and |p^x|≤p^{−m}≤r. Use the appropriate one-motive estimate at the boundary.

**Acceptance instances.**

- For F = ℚ, p ≥ 5, m = 1, r = 1/p and ε = 1/(2p): π_HT of the anticanonical locus lies in the union of discs of radius 1/p around ℤ_p.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T2/hodge-tate-flag-point`
- `HodgeTateAndCanonicalSubgroups:T4/flag-variety-balls`
- `HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci`
- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-hodge-tate`
- `HodgeTateAndCanonicalSubgroups:T3/hilbert-canonical-subgroup`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree-properties`
- `HodgeTateAndCanonicalSubgroups:T4/canonical-kernel-congruence`
- `HodgeTateAndCanonicalSubgroups:T4/ramified-period-comparison`
- `HilbertModularVarietiesAndShimuraCurves:H2`
- `HodgeTateAndCanonicalSubgroups:T2/open-tower-hodge-tate-map`
- `HodgeTateAndCanonicalSubgroups:T0/hodge-tate-boundary-extension`

**Source matches.**

- BHW, §5.3, Proposition 5.18, PDF p. 24 (arXiv:1902.03985v4): The statement and its hypotheses.
- BHW, §5.3, Proposition 5.18, PDF p. 24: The constants c_p.

### T4/ramified-period-comparison — The period estimates at primes ramified in F

**Theorem** · proposed name `TauCeti.HodgeTate.ramifiedPeriod_comparison` · implementation unchecked.

Let G/O_C (or the supplied full dual one-motive realization at a boundary chart) have a canonical level-n subgroup and the scalar O_C kernel congruence of T4/canonical-kernel-congruence at precision x=n−p^nw/(p−1)>0. Suppose the canonical generic module has the unsplit O_F/p^n rank-one generator of H2/H4. In an anticanonical frame write this generator as (c,1). Projection along every σ:O_p⊗O_C→O_C then puts the generic Hodge–Tate kernel coordinate in σ(c)+p^xO_C; equivalently the flag point lies in B_{|p^x|}(O_p:1) defined with the integral closure. The first-coordinate version gives the canonical ball around (1:pO_p). This projection lemma applies at ramified primes without an integral product decomposition. T4/period-map-inclusions applies it with n=m+1 and its separate radius hypotheses.

**Hypotheses.**

- The integral kernel congruence is over O_C; the canonical generator is over the unsplit finite order O_F/p^n. Neither uses freeness of V over O_p⊗O_C.
- This gives the projection step in the ramified repair conditional on the named canonical-generator/congruence inputs; their remaining supplier refinements stay recorded.

**Proof route.**

- Import T4/canonical-kernel-congruence and the unsplit O_F/p^n canonical generator. For an anticanonical frame its second coordinate is a unit in every local Artinian factor, so write the center as (c,1).
- Lift the congruence to (c,1)=v+p^x(e,f). Under each generic embedding σ, v has second coordinate 1−p^xσ(f), a unit since x>0; thus z_σ∈σ(c)+p^xO_C.
- The tuples of errors lie in the integral closure (O_p⊗O_C)^~⊂C^Σ. This proves membership in the defined ball without asserting O_p⊗O_C=O_C^Σ. Use the first-coordinate version for the canonical chart.

**Acceptance instances.**

- For F = ℚ(√p) and p ≥ 5 the statement gives the same radius as for p split.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T4/flag-variety-balls`
- `HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate`
- `HodgeTateAndCanonicalSubgroups:T3/hilbert-canonical-subgroup`
- `HilbertModularVarietiesAndShimuraCurves:H4`
- `HodgeTateAndCanonicalSubgroups:T4/canonical-kernel-congruence`
- `HilbertModularVarietiesAndShimuraCurves:H2`

**Source matches.**

- BHW, §5.3, proof of Proposition 5.18 (arXiv:1902.03985v4), PDF p. 24: BHW's proof uses the identification ℙ¹(𝒪_p ⊗ O_C) ≅ ℙ¹(O_C)^Σ, which fails for ramified p; the node replaces that step.

### T4/canonical-kernel-congruence — Congruence of the integral Hodge–Tate kernel

**Lemma** · proposed name `TauCeti.HodgeTate.canonicalKernel_congruence` · implementation unchecked.

Let G/O_C be a p-divisible group with free Tate module, conormal rank g and height 2g, let H_n be canonical with the conormal and raw character estimates at height w, and set δ=S_nw, y=n−δ, x=y−w/(p−1)=n−p^nw/(p−1)>0. With V=ker(T_pG⊗O_C→ω_GD), the images of V and H_n(C)⊗O_C in (T_pG⊗O_C)/p^x coincide. This is an O_C-module congruence, with no claim of local freeness over the ramified order O_p⊗O_C.

**Hypotheses.**

- Require the canonical conormal isomorphism, truncated kernel containment, finite-presentation/elementary-divisor degree calculation and the actual rank-g generic canonical module.
- On boundary charts use the full dual one-motive Tate realization and its conormal estimate, rather than silently replacing height 2g by the finite Raynaud height 2g−r.

**Proof route.**

- Let N be the kernel of the HT map modulo p^y. The raw cokernel degree w/(p−1) gives deg N=gy+w/(p−1).
- The reduced saturated V and canonical point span are free rank-g submodules inside N, each of degree gy. For a torsion-module quotient of total degree w/(p−1), the valuation elementary-divisor bound implies multiplication by any scalar of that valuation sends N into either submodule.
- Both reductions therefore coincide after passage to precision x=y−w/(p−1). This elementary-divisor argument is supplied by R07.1’s finite-presentation degree API, not by a ramified product decomposition.

**Acceptance instances.**

- At w=0, x=y=n and the two modules agree modulo p^n; at w>0 the loss w/(p−1) cannot be omitted.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-hodge-tate`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree-properties`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`
- `HilbertModularVarietiesAndShimuraCurves:H2`

**Source matches.**

- BHW, §5.3, proof of Proposition 5.18, PDF pp. 24–25: The two rank-g submodules in the truncated kernel agree after losing the raw HT cokernel valuation.

**Coverage: planned.**

- Boundary one-motives and arbitrary-C Raynaud realization: C4 supplies polarized [Y→G̃], the finite-flat torsion pieces and integral overlap uniqueness, plus arbitrary-base semi-abelian Verschiebung. R11.3 supplies the descent/existence or complete-C uniformization extension beyond its current DVR statements. Boundary coordinate estimates use the full height-2g dual one-motive realization, not the smaller finite Raynaud group.
- Inclusive geometric endpoint and ramified canonical generator: HALO Appendix A independently covers p=2 and the small all-prime formal radius, including the strict weak-bound inequality at its endpoint. The larger BHW pointwise radius still needs its p≥3 inclusive-endpoint refinement and exact unsplit O_F/p^n dual generator from H2/H4. The scalar kernel/degree argument and generic projection are separated; neither stability nor a generic decomposition proves integral O_F freeness.
- Siegel consumer domain refinement: The OverconvergentAutomorphicForms O8 request for the p>2g Siegel DRW §3.6 domain comparison needs its source read and exact comparison hypothesis. The present nodes cover the assigned general canonical and period-position targets; this additional consumer refinement is not established.
- Formal canonical-locus model identification: The adic canonical component is a finite-étale section. R2 must identify compatible normalized formal models over one common base before this strengthens to a formal isomorphism; generic-fibre isomorphism and normalization alone are insufficient.

## T5 — Igusa fibers, the formal integral lattice, strict-transform modifications and the actual AIP lift/structure-group calculation lead to comparison with O5’s independently constructed coefficient sheaves.

### T5/igusa-torsor — Igusa torsors of the dual canonical subgroup and the ordinary inverse tower

**Construction** · proposed name `TauCeti.HodgeTate.igusaTorsor` · planet **Igusa tower** · implementation unchecked.

Let F be totally real of degree g (F = ℚ for the modular curve), m ≥ 1 and 0 ≤ ε ≤ ε_m^can := p^{−(m+1)}, so that the universal semi-abelian A over X(ε) has a canonical subgroup H_m ⊂ A[p^m], étale-locally 𝒪_F/p^m on geometric generic points (T3/hilbert-canonical-subgroup). Its Cartier dual H_m^∨ = A^∨[p^m]/H_m^⊥ is étale on the generic fibre. The Igusa torsor X_{Ig(p^m)}(ε) → X(ε) is the finite étale (𝒪_F/p^m)^×-torsor representing 𝒪_F-linear isomorphisms 𝒪_F/p^m ≅ H_m^∨; these form a tower in m with transition maps reduction modulo p^m, and over the ordinary locus ε = 0 the limit X_{Ig(p^∞)}(0) = lim_m X_{Ig(p^m)}(0) is a pro-étale 𝒪_p^×-torsor parametrising 𝒪_p ≅ T_pH^∨ (H the multiplicative p-divisible subgroup), with a finite étale formal model at each finite level (the ordinary inverse tower). A partial Igusa trivialisation (of H_m^∨ only) is not a trivialisation of the whole Tate module.

**Hypotheses.**

- ε≤p^{−(m+1)} and the exact normal admissible Hilbert formal model and dual O_F/p^m-type of H2/H4 are supplied.
- At the boundary use the polarized one-motive finite-flat pieces and the toric canonical subgroup. Only over the ordinary formal locus is its dual étale integrally; away from that locus the torsor is asserted on the characteristic-zero generic fibre.

**Proof route.**

- Use the Hilbert supplier’s actual rank-one dual canonical module, including the polarization ideal. Its O_F-linear Isom sheaf from the chosen standard module is representable and a finite étale unit-group torsor on the generic fibre.
- Reduction gives the transition maps on a common smaller Hasse neighborhood. Over the ordinary formal locus the canonical subgroup is multiplicative, so its dual is étale over the formal base itself; the finite torsors there form the pro-étale ordinary inverse tower.

**Acceptance instances.**

- For the modular curve, X_{Ig(p)}(0) → X(0) is the classical Igusa curve of level p over the ordinary locus, a (ℤ/p)^×-torsor.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T3/hilbert-canonical-subgroup`
- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-properties`
- `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-torsion`
- `AbelianSchemesAndArithmeticModuli:A2`
- `AdicEtaleGeometry:A1/pro-etale-site-corrected`

**Source matches.**

- BHW, §7.1, Definition 7.1(2), PDF p. 28 (arXiv:1902.03985v4): The Hilbert Igusa torsor.
- BHW, §3.4, PDF p. 14: The elliptic ordinary Igusa tower and the map t.

**Uses.**

- BHW 2019, §§3.4, 7: the Igusa tower receives the map from the anticanonical perfectoid tower
- OverconvergentAutomorphicForms:O7: ordinary Igusa forms and the Hida comparison
- AIP (Hilbert) §§3–4: the torsor 𝔉 lives over the Igusa tower

**Planning API.**

- `TauCeti.HodgeTate.igusaTorsor` (constructor): X_{Ig(p^m)}(ε) → X(ε), the (𝒪_F/p^m)^×-torsor of 𝒪_F-linear isomorphisms 𝒪_F/p^m ≅ H_m^∨.
- `TauCeti.HodgeTate.igusaTorsor_transition` (functoriality): Reduction mod p^m gives X_{Ig(p^{m+1})}(ε′) → X_{Ig(p^m)}(ε′) for ε′ ≤ ε_{m+1}^can, equivariant for (𝒪_F/p^{m+1})^× → (𝒪_F/p^m)^×.
- `TauCeti.HodgeTate.ordinaryIgusaTower` (constructor): X_{Ig(p^∞)}(0) = lim X_{Ig(p^m)}(0), a pro-étale 𝒪_p^×-torsor over X(0) with finite étale formal models.
- `TauCeti.HodgeTate.igusaTorsor_universalTrivialisation` (data): The tautological isomorphism ψ_univ: 𝒪_F/p^m ≅ H_m^∨ over X_{Ig(p^m)}(ε).
- `TauCeti.HodgeTate.igusaTorsor_baseChange` (functoriality): Compatible with base change, prime-to-p Hecke correspondences and the 𝒪_F^{×,+}-action on polarisations.

**Mathematical tests.**

- `TauCeti.HodgeTate.igusaTorsor_degree` (computation): X_{Ig(p^m)}(ε) → X(ε) is finite étale of degree #(𝒪_F/p^m)^×; for F = ℚ, of degree p^{m−1}(p − 1).
- `TauCeti.HodgeTate.igusaTorsor_cusp` (degenerate): At a cusp of the modular curve (Tate curve), H_m = μ_{p^m} and H_m^∨ = ℤ/p^m, so the torsor is trivial over the cusp neighbourhood.
- `TauCeti.HodgeTate.igusaTorsor_not_fullLevel` (non-example): X_{Ig(p^m)}(ε) is not X_{Γ(p^m)}(ε): its fibres have #(𝒪_F/p^m)^× points, not #GL₂(𝒪_F/p^m); a partial Igusa trivialisation is not a Tate-module basis.

### T5/igusa-full-level-comparison — Igusa trivialisations and the full p-level tower

**Comparison** · proposed name `TauCeti.HodgeTate.igusaFullLevel_comparison` · implementation unchecked.

For 0 ≤ ε ≤ ε_m^can, the anticanonical full-level tower with universal α: 𝒪_p² ≅ T_pA^∨ maps to the Igusa torsor by the generator ψ: 𝒪_p/p^m → H_m^∨ obtained from α(e₁) followed by the dual canonical-subgroup quotient. Anticanonicity makes ψ an isomorphism of finite 𝒪_p/p^m-modules. The resulting map of spaces φ: X_{Γ(p^∞)}(ε)_a → X_{Ig(p^m)}(ε) is not claimed to be an isomorphism and does not factor through Γ₀-level, which forgets the generator. Under the pullback-frame convention α′ = α ∘ γ^∨, diagonal γ = diag(a,d) multiplies ψ by d mod p^m. BHW Proposition 7.11 uses φ and Hodge–Tate functoriality to lift the Igusa generator to the AIP torsor.

**Hypotheses.**

- Uses the corrected indexing of BHW Proposition 7.11 (m, not n, in 'the dual of the inclusion H_m → A[p^m]' and '(1, 0) mod p^m').

**Proof route.**

- At a geometric point, the image of α(e₁) generates the dual canonical quotient exactly on the anticanonical domain; this proves that ψ is an isomorphism of finite modules, hence defines the map to the Igusa cover.
- For diagonal matrices compute γ^∨e₁ = d e₁. General Γ₀(p) does not act by the scalar d on a fixed generator at arbitrary level, and forgetting a generator does not preserve the map φ.

**Acceptance instances.**

- For the modular curve at ε = 0, φ sends (E, α) to the image of α(1, 0) in E[p^m]/E[p^m]^0 ≅ H_m^∨.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci`
- `HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical`
- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-properties`
- `PerfectoidShimuraVarieties:S0/infinite-level-diamond`
- `PerfectoidShimuraVarieties:S0/p-level-tower`
- `HodgeTateAndCanonicalSubgroups:T0/finite-hodge-tate-naturality`
- `HilbertModularVarietiesAndShimuraCurves:H4`

**Source matches.**

- BHW, §7.2, Proposition 7.11 (arXiv:1902.03985v4), PDF p. 30: BHW Proposition 7.11 and its proof: the map ϕ to the Igusa tower.

### T5/integral-differential-lattice — The modified integral lattice ω^int

**Construction** · proposed name `TauCeti.HodgeTate.integralDifferentialLattice` · planet **Modified integral lattice ω^int** · implementation unchecked.

On the Igusa cover of a normal admissible Hilbert Hasse model, let ω⁺ be the integral conormal sheaf and Hdg_T the invertible determinant ideal of the canonical character matrix, with Hdg_T^{p−1}=Hdg. Put I_m=p^m Hdg_T^{−(p^m−1)} and I′_m=p^m Hdg_T^{−p^m}. In the radius ε≤p^{−(m+1)} these are integral ideals, with I_m⊂I′_m. The truncated conormal isomorphism gives the class u=HT(ψ(1)) in ω⁺/I_mω⁺ of the universal dual canonical generator. Define ω^int to be the inverse image of its (O_F⊗O⁺)-span. The formal generator-matrix theorem and its integral generic-fibre transfer identify this preimage with a locally free rank-one O_F⊗O⁺-module F satisfying Hdg_Tω⁺⊂F⊂ω⁺ and HT′:(O_F⊗O⁺)/I′_m≅F/I′_mF. This uses integer powers of the supplied invertible ideal, not an undefined real power of Hdg.

**Hypotheses.**

- Require a normal p-torsion-free admissible formal chart, invertible total Hasse ideal, the unsplit dual canonical generator and the formal-to-O⁺ matrix transfer of R2.
- The conormal projection has kernel contained in I_mω⁺. Equality of that kernel with I_mω⁺ is not assumed, since the asserted middle exactness in BHW Lemma 7.2 fails in dimensions greater than one.
- At ramified primes ω⁺ may fail the rank-one Rapoport condition; F’s rank-one property is the explicit generator theorem, not a consequence of O_F-stability or of the generic embedding decomposition.

**Proof route.**

- Construct u by the Igusa generator, finite character map and truncated conormal comparison.
- On a formal chart choose the O_F-linear canonical generator. Write its character images in an R-basis of ω as columns of M, whose determinant generates Hdg_T. The adjugate gives Hdg_Tω⊂im M; the radius implies I_mω⊂im M.
- Consequently the inverse-image definition equals im M. The regular determinant makes R^g→im M an isomorphism, and the explicit O_F-linear generator identifies this image with O_F⊗R. AIPH Proposition 4.1 proves the reduced HT′ isomorphism.
- Use R2’s integral pullback theorem on the same matrix and its inverse to obtain the analytic O⁺ statement.

**Acceptance instances.**

- At an ordinary point (Hdg = O⁺), ω^int = ω⁺ and HT′ is the Hodge–Tate isomorphism of the multiplicative H_m (T0/multiplicative-hodge-tate-isomorphism).

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-hodge-tate`
- `HodgeTateAndCanonicalSubgroups:T0/finite-hodge-tate-map`
- `HodgeTateAndCanonicalSubgroups:T0/conormal-module`
- `HodgeTateAndCanonicalSubgroups:T0/multiplicative-hodge-tate-isomorphism`
- `HodgeTateAndCanonicalSubgroups:T3/hasse-neighbourhood`
- `mathlib:Module.Invertible`
- `HodgeTateAndCanonicalSubgroups:T0/conormal-right-exact`
- `mathlib:SheafOfModules.Submodule`
- `mathlib:SheafOfModules.IsLocallyFree`

**Source matches.**

- BHW, §7.1, Definition 7.3 (arXiv:1902.03985v4), PDF p. 29: BHW Definition 7.3 / Proposition 7.4: the lattice ω^int.
- BHW, §7.1, PDF p. 29 (arXiv:1902.03985v4): ω^int as a second integral structure, better behaved at ramified p.
- AIPH, §4.1, Proposition 4.1 (author copy), PDF p. 15: AIP (Hilbert), Proposition 4.1.

**Uses.**

- BHW 2019, §7: comparison of the perfectoid and AIP overconvergent sheaves
- AIP (Hilbert) §4: the torsor 𝔉 and the sheaves w^κ
- OverconvergentAutomorphicForms:O3/ramified-modified-lattice: integral coefficients at ramified primes

**Planning API.**

- `TauCeti.HodgeTate.igusaHodgeTateClass` (constructor): ψ(1) ∈ ω⁺/I_mω⁺, the Hodge–Tate image of the universal Igusa generator.
- `TauCeti.HodgeTate.integralDifferentialLattice` (constructor): ω^int := preimage in ω⁺ of the 𝒪_F ⊗ O⁺-span of ψ(1).
- `TauCeti.HodgeTate.integralDifferentialLattice_locallyFree` (instance): ω^int is locally free of rank one over 𝒪_F ⊗ O⁺.
- `TauCeti.HodgeTate.integralDifferentialLattice_bounds` (relation): Hdg_Tω⁺⊂ω^int⊂ω⁺, where Hdg_T^{p−1}=Hdg on the normal formal Hilbert model.
- `TauCeti.HodgeTate.integralDifferentialLattice_hodgeTate` (characterisation): HT′: 𝒪_F ⊗ O⁺/I′_m ≅ ω^int/I′_mω^int, 1 ↦ ψ(1).
- `TauCeti.HodgeTate.integralDifferentialLattice_indep` (compatibility): After pullback to a common normal formal model with compatible canonical generators, the level-m and level-m′ lattices agree; use the determinant/inclusion argument of T5/integral-lattice-level-independence.

**Mathematical tests.**

- `TauCeti.HodgeTate.integralDifferentialLattice_ordinary` (degenerate): On the ordinary locus (ε = 0), ω^int = ω⁺.
- `TauCeti.HodgeTate.integralDifferentialLattice_colength` (computation): At a rank-one point of Hodge height w (F = ℚ), ω⁺/ω^int ≅ O_C/p^{w/(p−1)}.
- `TauCeti.HodgeTate.integralDifferentialLattice_ne_plus` (non-example): At a non-ordinary point ω^int ≠ ω⁺ (its colength is w/(p−1) > 0), so ω^int is not the natural formal-model lattice; at ramified p, ω⁺ is not even locally free over 𝒪_F ⊗ O⁺.

### T5/integral-lattice-properties — Local freeness, independence of level and cokernel estimates for ω^int

**Theorem** · proposed name `TauCeti.HodgeTate.integralLattice_properties` · implementation unchecked.

Under T5/integral-differential-lattice’s exact formal-model and transfer hypotheses, F=ω^int is locally free of rank one over O_F⊗O⁺, Hdg_Tω⁺⊂F⊂ω⁺, and HT′:(O_F⊗O⁺)/I′_m≅F/I′_mF. Every lift in ω⁺ of the universal canonical character belongs to F and agrees with HT′(1) modulo I′_mF. The lattices at different levels agree on a common radius/model by T5/integral-lattice-level-independence. These statements are compatible with the supplied integral base change, Igusa transitions and prime-to-p isogenies. On the ordinary formal locus F=ω⁺.

**Hypotheses.**

- The formal matrix proof and integral O⁺ transfer are separate inputs. Pointwise ranks and normality alone are not a sheaf-theoretic local-freeness proof.
- Use F/I′_mF, not F/I′_m without a specified module action. The exact model and common-level compatibility are part of R2/H4’s contract.

**Proof route.**

- Apply the matrix/adjugate calculation of the construction and AIPH Proposition 4.1 for local freeness, bounds and HT′.
- If two lifts agree modulo I_mω⁺, their difference lies in I′_mF because I_m=I′_mHdg_T and Hdg_Tω⁺⊂F; this proves the lift assertion.
- Apply the separate level-independence lemma and naturality of the character matrix for compatible base changes/prime-to-p isogenies.
- At height zero Hdg_T is the unit ideal and the multiplicative character map identifies F with ω⁺.

**Acceptance instances.**

- At a rank-one point of Hodge height w for F = ℚ and m = 1: I′₁ = p^{1 − pw/(p−1)} and ω^int/I′₁ ≅ O_C/p^{1−pw/(p−1)}.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice`
- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-hodge-tate`
- `HodgeTateAndCanonicalSubgroups:T0/hodge-tate-map-compatibilities`
- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `AdicSpacesPartII:R2`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-level-independence`

**Source matches.**

- BHW, §7.1, Proposition 7.4 (arXiv:1902.03985v4), PDF p. 29: BHW Proposition 7.4.
- BHW, §7.1, Corollary 7.6, PDF p. 29 (arXiv:1902.03985v4): Lifts of ψ(1) lie in the AIP torsor.

### T5/modified-hodge-bundle — The modified Hodge bundle ω^mod at full level p^n

**Construction** · proposed name `TauCeti.HodgeTate.modifiedHodgeBundle` · planet **Modified Hodge bundle ω^mod** · implementation unchecked.

For the normal admissible Siegel toroidal full-level-p^n formal model, and for the precisely specified Hilbert–Siegel models requested from C4/C5, let HT denote the extended one-motive character map. For p≥3 set b=1/(p−1) and take n>b. Its image lattice is the subsheaf generated by local lifts of HT and p^bω; the integral annihilator estimate makes it the inverse image of the finite-level HT image. Take the successive/simultaneous admissible minor blowups and normalization of PS16 (sizes g,g−1,…,1); use the strict transform, the torsion-free image inside the pulled-back ω. It is locally free of O-rank g, with p^bω⊂ω^mod⊂ω and a surjective reduced map to ω^mod/p^{n−b}ω^mod. For GSp₄/F, BCGP uses the product of the placewise 2×2 minor ideals and the O_F-rank-two image on its charts; this requires their coefficient-order/local-presentation hypotheses and is not inferred from a generic decomposition at ramified p. For p=2 PS16 reports b=2 in Remark 1.10 without a written proof; this variant is conditional on the separate small-prime boundary estimate, requires n>b for the common descriptions, and is recorded as a gap.

**Hypotheses.**

- Use the normal admissible p-torsion-free formal model and the extended full one-motive HT map of C4/C5. The finite-Raynaud group alone has the wrong boundary height for the full-level frame.
- For p≥3 use PS16 Theorem 1.9. For p=2 the exponent is 2, not 1/(p−1); the unproved-in-source estimate is requested explicitly.
- Raw tensor pullback of the image need not be locally free. The normalized blowups principalize the relevant minor ideals and the construction retains the image/strict transform.
- Before using the placewise GSp₄/F matrix construction, specify the integral order and the locally free coefficient presentations on those charts; arbitrary ramified Deligne–Pappas ω is not assumed free over O_F⊗O.

**Proof route.**

- Form the image lattice on the full-level model using the extended character matrix and its uniform annihilator bound.
- Principalize the successive determinantal ideals on the normal admissible blowups. On a chart where a chosen maximal minor generates its ideal, the adjugate gives a free set of image columns; continue over the required ranks and glue the torsion-free images.
- The containments imply p^nω⊂p^{n−b}ω^mod, so the finite-level map factors through the reduced modified lattice; the selected image generators prove surjectivity.
- For GSp₄/F repeat the matrix step over the specified placewise coefficient orders and identify the product modification. The ramified model extension and p=2 boundary bound remain precise supplier refinements.

**Acceptance instances.**

- On the ordinary locus ω^mod = ω.
- For the modular curve (g = 1), ω^mod is generated by the Hodge–Tate images of the basis of (ℤ/p^n)² and p^{1/(p−1)}ω.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T0/hodge-tate-boundary-extension`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-hodge-tate-cokernel`
- `HodgeTateAndCanonicalSubgroups:T0/conormal-module`
- `AdicSpacesPartII:R2/admissible-blow-up`
- `AdicSpacesPartII:R2/generic-fibre-inverts-admissible-blow-ups`
- `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`
- `AdicSpacesPartII:R2`
- `mathlib:SheafOfModules.Submodule`
- `mathlib:SheafOfModules.IsLocallyFree`

**Source matches.**

- BCGP21, §6.1.4, p. 141 (arXiv:1812.09269v3): BCGP's blow-up of the minor ideals.
- BCGP21, §6.1.4, p. 141: The 2 × 2 minors at each v | p.
- PS16, §1.8, construction before Proposition 1.13 (author copy; published Proposition 1.10), PDF p. 6: Pilloni–Stroh: blow-up along the minors of sizes g, …, 1.
- PIL20, §12.2.1, PDF p. 74: Pilloni's restatement for Siegel threefolds.

**Uses.**

- Pilloni–Stroh 2016, §1.8; Pilloni 2020, §12: coherent cohomology at infinite level
- BCGP 2021, §§6.1–6.2: higher Coleman theory for GSp₄ over F
- PerfectoidShimuraVarieties:S3/hodge-tate-formal-models: normalised formal models with Hodge–Tate sections

**Planning API.**

- `TauCeti.HodgeTate.modifiedModel` (constructor): 𝔛^mod → 𝔛, the normalised blow-up of the minor ideal of the Hodge–Tate matrix.
- `TauCeti.HodgeTate.modifiedHodgeBundle` (constructor): The strict-transform/image lattice on the specified normal admissible minor modification; for p≥3 b=1/(p−1), while the p=2 b=2 variant requires the recorded supplier estimate.
- `TauCeti.HodgeTate.modifiedHodgeBundle_locallyFree` (instance): ω^mod is locally free (over 𝒪_F ⊗ O for Hilbert–Siegel data).
- `TauCeti.HodgeTate.modifiedHodgeBundle_bounds` (relation): p^bω⊂ω^mod⊂ω with the exact prime-dependent b and level n>b.
- `TauCeti.HodgeTate.modifiedHodgeBundle_hodgeTate_surjective` (characterisation): The reduced linearized HT map surjects onto ω^mod/p^{n−b}ω^mod on the specified modified formal model.
- `TauCeti.HodgeTate.modifiedModel_generic` (compatibility): 𝔛^mod → 𝔛 is an isomorphism on adic generic fibres.

**Mathematical tests.**

- `TauCeti.HodgeTate.modifiedHodgeBundle_ordinary` (degenerate): On the ordinary locus the image lattice is ω and its minor ideal is a unit, so the required modification restricts to the identity there. This does not assert that every chosen extraneous blowup is the identity.
- `TauCeti.HodgeTate.modifiedHodgeBundle_colength` (computation): For g = 1 at a rank-one point with a canonical subgroup and Hodge height w, ω/ω^mod ≅ O_C/p^{w/(p−1)}.
- `TauCeti.HodgeTate.modifiedHodgeBundle_not_locallyFree_before_blowup` (non-example): Before the blow-up, the image sheaf is not locally free in general (it is generated by 2g sections with non-invertible minor ideal).

### T5/modified-minimal-model — The modified minimal model and the descent of the Hodge–Tate determinant

**Construction** · proposed name `TauCeti.HodgeTate.modifiedMinimalModel` · implementation unchecked.

On the exact normal full-level minimal Stein model supplied by C5, descend the degree-g exterior-power Hodge–Tate map modulo p^n using the coefficient pushforward identity. For GSp₄/F retain its placewise O_F exterior-square factor and restriction-of-scalars determinant convention. Normalize the blowup of its coefficient ideal to obtain 𝔛^{*−mod}, an isomorphism on generic fibres, with an invertible determinant image L^mod⊂detω. Put b=1/(p−1) for p≥3 and b=2 for p=2, the latter conditional on the separately verified PS16 Remark 1.10 estimate. For g the underlying abelian dimension set D=gb and require n>D. Then p^D detω⊂L^mod⊂detω and the exterior-power map surjects onto L^mod/p^{n−D}. Thus for GSp₄/F, g=2[F:ℚ], D=2[F:ℚ]/(p−1) at odd p and D=4[F:ℚ] conditionally at p=2. The compatible toroidal modification maps to 𝔛^{*−mod} and pulls L^mod back to detω^mod on the toroidal side.

**Hypotheses.**

- Use the normal admissible minimal full-level model of C5; C6’s HBAV minimal model is not a supplier for Hilbert–Siegel GSp₄/F.
- For p≥3 choose n≥n₀, the least integer strictly greater than g/(p−1). For p=2 PS16’s separate reported exponent 2 gives n₀=2g+1 and remains conditional on that estimate.
- C5 must supply mod-p^k pushforward and the exact coefficient descent on these models. Lan Theorem 8.7 permits arbitrary coefficient algebras but requires Definition 8.5 and the simple-algebra/dimension condition; it does not alone prove this separate pushforward identity.
- For GSp₄/F the local exterior-square module has coefficient-order rank six. The determinant of the underlying O-rank-2[F:ℚ] bundle uses restriction of scalars and the determinant/norm operation; it is not that rank-six module.

**Proof route.**

- Use the C5 mod-p^k structure-sheaf pushforward identity and projection formula to descend the determinant sections, as in PS16 Corollary 1.7 using A.10.
- For GSp₄/F form the placewise exterior-square maps, then the restriction-of-scalars determinant/norm map; verify BCGP Remark 6.2.2’s factorization in the specified integral coefficient model.
- Normalize the blowup of the descended coefficient ideal. Its image is an invertible modified determinant lattice. Exterior powers of the bound p^bω⊂ω^mod give p^{gb}detω⊂detω^mod⊂detω and the reduced surjection.
- The universal properties of the chosen blowups and normalizations give the map from the toroidal modification; establish the exact model/coefficient descent via C5, not through the unrelated HBAV C6 model.

**Acceptance instances.**

- For the modular curve, 𝔛^*_{K(p^n)} is the normalisation of the minimal compactification at full level p^n, and det ω^mod = ω^mod.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T5/modified-hodge-bundle`
- `HodgeTateAndCanonicalSubgroups:T0/hodge-tate-boundary-extension`
- `ShimuraCompactifications:C5/integral-minimal-space`
- `AdicSpacesPartII:R2/admissible-blow-up`
- `AdicSpacesPartII:R2`
- `ShimuraCompactifications:C5`

**Source matches.**

- BCGP21, §6.2.1, p. 143 (arXiv:1812.09269v3): The Stein factorisation at level p^n.
- BCGP21, §6.2.1, Remark 6.2.2, p. 144: Remark 6.2.2.
- PS16, §1.4, Corollaire 1.7 (author copy; published Corollaire 1.4), PDF p. 5: Pilloni–Stroh Corollaire 1.7: descent of the Hodge–Tate sections.
- PIL20, §12.9.1, PDF p. 80: Pilloni's restatement.
- PS16, §1.19, PDF p.8; Remark 1.10, PDF p.5; Corollary A.10, PDF p.26: Determinant precision is n−g/(p−1) at odd p and conditionally n−2g at p=2; pushforward is a separate assertion.

**Uses.**

- BCGP 2021, Theorem 6.2.6: vanishing of higher coherent cohomology on affinoids of the minimal compactification
- Pilloni 2020, §12.9: Siegel threefolds
- PerfectoidShimuraVarieties:S3/hodge-tate-formal-models: det ω^mod descending to an ample sheaf

**Planning API.**

- `TauCeti.HodgeTate.minimalLevelModel` (constructor): 𝔛^*_{K(p^n)}, the Stein factorisation of 𝔛_{K(p^n)} → 𝔛^*.
- `TauCeti.HodgeTate.hodgeTateDeterminant_descends` (relation): Λ^gHT is the pullback of a map on 𝔛^*_{K(p^n)}.
- `TauCeti.HodgeTate.modifiedMinimalModel` (constructor): 𝔛^{*−mod}_{K(p^n)}, the normalised blow-up of the coefficient ideal of Λ^gHT.
- `TauCeti.HodgeTate.modifiedDetHodge_bounds` (relation): For D=gb, p^D detω⊂L^mod⊂detω; b=1/(p−1) for odd p and b=2 conditionally for p=2. For GSp₄/F, g=2[F:ℚ].
- `TauCeti.HodgeTate.modifiedDetHodge_surjective` (characterisation): For n>D the exterior-power character map surjects onto L^mod/p^{n−D}, with the same prime-dependent conditional D.

**Mathematical tests.**

- `TauCeti.HodgeTate.modifiedMinimalModel_ordinary` (degenerate): Over the ordinary locus 𝔛^{*−mod} = 𝔛^* and det ω^mod = det ω.
- `TauCeti.HodgeTate.modifiedDetHodge_factor` (computation): For GSp₄/F each local factor Λ²_{𝒪_{F_v}/p^n}(𝒪_{F_v}/p^n)^4 has rank six over 𝒪_{F_v}/p^n. The determinant of the underlying rank-2[F:ℚ] module is obtained using restriction of scalars and the determinant/norm construction; a tensor of those rank-six modules must not be confused with that determinant line.
- `TauCeti.HodgeTate.modifiedMinimalModel_not_toroidal` (non-example): The minimal modified determinant line pulls back along the compatible toroidal-to-minimal modified map to detω^mod (PIL20 §12.9.1, PDF p.80). This determinant descent does not imply that the full finite-level Hodge bundle descends to the minimal model.

### T5/modified-plus-sheaf — The étale sheaf ω^{mod,+}

**Definition** · proposed name `TauCeti.HodgeTate.modifiedPlusSheaf` · implementation unchecked.

Over the analytic Siegel (or Hilbert–Siegel) variety 𝒳 at spherical level, ω_G^{mod,+} is the sheaf of O⁺_𝒳-modules on 𝒳_ét whose sections over U → 𝒳 étale are the integral differentials at the origin of G generated by the image of the Hodge–Tate period map over the full-level cover U ×_𝒳 𝒳(p^n), descended; its pullback to 𝒳(p^n) for n ≥ 1 (n ≥ 2 if p = 2) is the generic-fibre incarnation of ω^mod (T5/modified-hodge-bundle). It does not come from the analytic site of 𝒳 in general, and it satisfies p^{1/(p−1)}ω⁺ ⊂ ω^{mod,+} ⊂ ω⁺ (p ≥ 3).

**Hypotheses.**

- An integral module sheaf on the actual étale site is supplied by descent; it is not asserted to arise from the analytic site.
- Apply the level independence of PS16 Lemma 1.12 with its prime-dependent bound: n≥1 for p≥3, n≥2 for the reported p=2 variant. The strict n>b condition used for equal lattice descriptions must be distinguished from the lemma’s level convention.
- The p=2 uniform boundary estimate remains a supplier gap; no global p=2 exponent-one assertion is made.

**Proof route.**

- On a finite full-level étale cover use the O⁺-span of the character images with the prescribed bound. PS16 Lemma 1.12 proves level independence under its hypotheses.
- Character functoriality gives descent equivariance under the full-level group; effective integral étale descent identifies the sheaf at spherical level. The full-level pullback is the integral generic-fibre image lattice.
- Transport the prime-dependent containment through descent. The resulting étale sheaf need not come from the analytic topology.

**Acceptance instances.**

- Over the ordinary locus ω^{mod,+} = ω⁺.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T5/modified-hodge-bundle`
- `AdicEtaleGeometry:A1/pro-etale-site-corrected`
- `PerfectoidSpaces:P0/almost-basic-setup`
- `mathlib:SheafOfModules.Submodule`
- `mathlib:SheafOfModules.IsLocallyFree`

**Source matches.**

- PIL20, §12.7.1, PDF p. 77: Pilloni's definition.
- PIL20, §12.7.1, PDF p. 77: Generated by Hodge–Tate images.
- PIL20, §12.7.1, PDF p. 77: Not from the analytic site; pullback to finite level.

**Uses.**

- Pilloni 2020, §12.7: integral structures for higher Hida theory
- PerfectoidShimuraVarieties:S3: comparison with π_HT^*ω_Fl⁺

**Planning API.**

- `TauCeti.HodgeTate.modifiedPlusSheaf` (constructor): ω^{mod,+} on 𝒳_ét, the O⁺-span of Hodge–Tate images, descended from finite level.
- `TauCeti.HodgeTate.modifiedPlusSheaf_pullback` (compatibility): Its pullback to 𝒳(p^n), n ≥ 1 (n ≥ 2 if p = 2), is the generic fibre of ω^mod.
- `TauCeti.HodgeTate.modifiedPlusSheaf_bounds` (relation): p^{1/(p−1)}ω⁺ ⊂ ω^{mod,+} ⊂ ω⁺ (p ≥ 3).
- `TauCeti.HodgeTate.modifiedPlusSheaf_indep` (compatibility): Independent of the auxiliary level n used to define it.

**Mathematical tests.**

- `TauCeti.HodgeTate.modifiedPlusSheaf_ordinary` (degenerate): ω^{mod,+} = ω⁺ over the ordinary locus.
- `TauCeti.HodgeTate.modifiedPlusSheaf_rankOne` (computation): At a rank-one point of an elliptic curve with Hodge height w < 1/(p+1), ω⁺/ω^{mod,+} ≅ O_C/p^{w/(p−1)}.
- `TauCeti.HodgeTate.modifiedPlusSheaf_not_analytic` (non-example): ω^{mod,+} is not a sheaf on the analytic site of 𝒳 in general: its sections over an affinoid need not be determined by a single analytic formal model at spherical level.

### T5/aip-torsor — The Andreatta–Iovita–Pilloni torsor

**Construction** · proposed name `TauCeti.HodgeTate.aipTorsor` · planet **Andreatta–Iovita–Pilloni torsor** · implementation unchecked.

In the situation of T5/integral-differential-lattice, let 𝔉_m := {w ∈ ω^int : w ≡ HT′(1) mod I′_m ω^int}. Its analytic total space 𝔉_m(ε) → X_{Ig(p^m)}(ε) is a torsor for the analytic topology under 1 + I′_m·Res_{𝒪_F/ℤ}𝔾̂_a, and 𝔉_m(ε) → X(ε) is an étale torsor under B_m := 𝒪_p^×·(1 + I′_m·Res_{𝒪_F/ℤ}𝔾̂_a) ⊂ Res_{𝒪_F/ℤ}𝔾_m; 𝔉_m(ε) → T(ω) (the total space of ω^×) is an open immersion. Over X(ε) and for x := m − εp^m/(p − 1), B_m ⊂ 𝒪_p^×(1 + p^x Res 𝔾̂_a), with equality where |Ha| = |p|^ε. The associated weight sheaf is constructed by OverconvergentAutomorphicForms O5 from this torsor; this node supplies the torsor and its action.

**Hypotheses.**

- The inclusion goes B_m ⊂ 𝒪_p^×(1 + p^x Res 𝔾̂_a), not the reverse as printed in BHW (7.1) (sourceIssues); where the reverse inclusion is used, use the point's own Hodge height or c ∈ p𝒪_p.
- The level m is tied to the weight: m = k + r − 1 for κ on the k-th piece of weight space (r = 3, or 5 for p = 2); BHW's Definition 7.9 prints m = k + r (sourceIssues).
- Continuous torsor descent with coefficients is PerfectoidSpaces P9's (RS-05 owners entry).

**Proof route.**

- 𝔉_m is an O⁺-torsor under 1 + I′_m by T5/integral-lattice-properties (3); adjoin the 𝒪_p^×-action from the Igusa torsor to get the B_m-torsor over X(ε).
- Open immersion into T(ω): 𝔉_m is defined by a congruence on a generator of the locally free ω^int.
- Bound on B_m: p^ε ∈ Hdg gives |p^mHdg^{−p^m/(p−1)}| ≤ |p^x|.

**Acceptance instances.**

- For F = ℚ at ε = 0, 𝔉_m is the set of generators of ω⁺ congruent to the Hodge–Tate image of the Igusa generator modulo p^m.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties`
- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `PerfectoidSpaces:P9`
- `mathlib:Module.Invertible`

**Source matches.**

- BHW, §7.1, Definition 7.5, PDF p. 29 (arXiv:1902.03985v4): The AIP torsor.
- BHW, §7.1, Definition 7.5, PDF p. 29: The (corrected) comparison with 𝒪_p^×(1 + p^x Res 𝔾̂_a).
- AIPH, §4.2, the torsor F_{n,r,I} (author copy), PDF p. 16: AIP (Hilbert): the torsor 𝔉.

**Uses.**

- Andreatta–Iovita–Pilloni (Hilbert, Siegel): overconvergent sheaves of weight κ
- BHW 2019, Theorem 7.14: comparison with the perfectoid sheaf
- OverconvergentAutomorphicForms:O5/aip-independent-coefficients: the independent AIP construction

**Planning API.**

- `TauCeti.HodgeTate.aipTorsor` (constructor): 𝔉_m(ε) := {w ∈ ω^int : w ≡ HT′(1) mod I′_m}, a torsor under 1 + I′_m Res 𝔾̂_a over X_{Ig(p^m)}(ε).
- `TauCeti.HodgeTate.aipTorsor_structureGroup` (structure): 𝔉_m(ε) → X(ε) is an étale B_m-torsor, B_m = 𝒪_p^×(1 + I′_m Res 𝔾̂_a).
- `TauCeti.HodgeTate.aipTorsor_openImmersion` (characterisation): 𝔉_m(ε) → T(ω) is an open immersion.
- `TauCeti.HodgeTate.aipTorsor_bound` (relation): B_m ⊂ 𝒪_p^×(1 + p^x Res 𝔾̂_a) over X(ε), x = m − εp^m/(p−1).
- `TauCeti.HodgeTate.aipTorsor_lift` (relation): Every lift in ω⁺ of ψ(1) ∈ ω⁺_{H_m} is a section of 𝔉_m (T5/integral-lattice-properties (4)).

**Mathematical tests.**

- `TauCeti.HodgeTate.aipTorsor_ordinary` (degenerate): At ε = 0, B_m = 𝒪_p^×(1 + p^m Res 𝔾̂_a) and 𝔉_m is the torsor of generators of ω⁺ congruent to the Igusa generator mod p^m.
- `TauCeti.HodgeTate.aipSheaf_classical` (compatibility): The O5 sheaf associated to this torsor and an algebraic weight κ=x^k agrees with ω^{⊗k}; this is an imported consumer compatibility test, not a second construction of the weight sheaf.
- `TauCeti.HodgeTate.aipTorsor_bound_direction` (non-example): The reverse inclusion 𝒪_p^×(1 + p^x Res 𝔾̂_a) ⊂ B_m fails at points where |Ha| > |p|^ε, since there I′_m ⊊ p^xO⁺.

### T5/aip-hodge-tate-comparison — The AIP torsor and the Hodge–Tate trivialisation on the anticanonical tower

**Theorem** · proposed name `TauCeti.HodgeTate.aipHodgeTate_comparison` · planet **AIP–Hodge–Tate comparison** · implementation unchecked.

On a common admitted weight/radius chart, and conditional on the stated integral-model, Igusa, integral-generator and effective-descent contracts, the AIP torsor and canonical Hodge–Tate section identify O5’s independently constructed analytic O⁺ coefficient sheaf with the perfectoid inverse-weight coefficient sheaf, and identify their rationalizations. Choose an actual common analytic extension of the bounded smooth κ and the AIP universal-coordinate interval, canonical level and formal-radius conditions; no radius ε_κ computed from BHW’s all-unit supremum or Proposition 6.3 formula is asserted. For finite n≥1 pull the AIP sheaf back by AL_n on the scaled p^nε domain and use the supplied AIPH Theorem 6.7(3) forgetful-restriction comparison; the section is s∘u_n. For n=∞ use s and structural forgetful pullback. At n=0 use AL_1 on both constructions. Prime-to-p naturality holds; p-Hecke is a separate O6 input.

**Hypotheses.**

- O5 supplies the independent analytic eigenfunction sheaf on the actual B_m torsor, completed integral coefficients and an invertible local generator whose HT pullback is a unit in O⁺. For full finite-character weights this last input remains an explicit gap; formal coherence or rational invertibility alone does not prove it.
- Use T5/hodge-tate-aip-lift and T5/aip-automorphy-factor for the actual B_m-valued transformation factor; the reversed ambient radius bound proves neither assertion.
- The integral descent theorem must apply on the stated coefficient-base product and topology, with effective continuous descent and equality of O⁺ invariants. These hypotheses are requested from P9.
- Finite Atkin–Lehner uses the scaled domain p^nε with the prescribed radius restrictions; its forgetful restriction is the AIPH comparison supplier, not an invented identification.
- Choose an AIPH §4.2 interval I=[p^k,p^k′], r_AIP≥3 and r_AIP+k≥m≥k′+2 (odd p) or k′+4 (p=2), with its actual universal-coordinate chart. Intersect its radius with the canonical and common analytic-character ranges. A corrected pro-p supremum is not identified with those coordinates without proof.

**Proof route.**

- The factorization and ratio lemmas give a B_m-equivariant lift of the canonical HT section on the anticanonical tower.
- Evaluate a κ-equivariant function on that lift. The scalar formula and cocycle give exactly the κ^{-1}(cz+d) law defining the independent perfectoid coefficient sheaf.
- Import the O5 integral generator with unit HT pullback f. For any perfectoid equivariant integral g, g/f is invariant and integral; P9 identifies the invariant completed O⁺ ring with the base. This gives integral surjectivity and local freeness without assuming the equalizer is already a line. Glue using the supplied transition units. The full finite-character generator step remains a recorded conditional input.
- Apply the finite-level scaled AL_n and forgetful restriction conventions; use the structural map for n=∞ and the AL_1 on both sides for n=0. Prime-to-p functoriality follows from naturality of the character construction; import p-Hecke from O6.

**Acceptance instances.**

- For F = ℚ, κ = x^k, both sheaves are ω^{⊗k} and the isomorphism is the identity on q-expansions at ∞.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/igusa-full-level-comparison`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties`
- `HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate`
- `HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions`
- `HodgeTateAndCanonicalSubgroups:T0/hodge-tate-map-compatibilities`
- `PerfectoidSpaces:P9`
- `PerfectoidShimuraVarieties:S0/infinite-level-diamond`
- `HilbertModularVarietiesAndShimuraCurves:H4`
- `HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift`
- `HodgeTateAndCanonicalSubgroups:T5/aip-automorphy-factor`
- `OverconvergentAutomorphicForms:O5`

**Source matches.**

- BHW, §7.2, Theorem 7.14, PDF p. 31 (arXiv:1902.03985v4): The main comparison.
- BHW, §5.3, PDF p. 26: The Hodge–Tate trivialisation s.
- BHW, §3.3, Lemma 3.19, PDF p. 13: Equivariance through cz + d.
- AIPH, §6, Theorem 6.7(3), PDF p. 29: The Frobenius/restriction comparison of coefficient sheaves is the input iterated in the finite-level AL_n/forgetful comparison, together with BHW Theorem 7.14.

### T5/integral-lattice-level-independence — Level independence of the integral lattice

**Lemma** · proposed name `TauCeti.HodgeTate.integralDifferentialLattice_level_eq` · implementation unchecked.

On a common normal p-torsion-free Hilbert formal model with compatible dual canonical generators at m′≥m and ε≤p^{−(m′+1)}, the modified lattices F_m and F_m′ inside ω are equal. Both have determinant ideal Hdg_T and rank-one O_F-linear generators, and their analytic O⁺ pullbacks are equal as well.

**Hypotheses.**

- Require the explicit matrices, invertible regular determinant ideal Hdg_T and a common integral model; mere equality of generic fibres is insufficient.
- Use I_m′⊂I_m in this radius and compatibility of the finite character classes. AIPH Proposition 4.7 is a weight-sheaf comparison, not a citation for equality of these lattices.

**Proof route.**

- The compatible higher-level generator reduces to the lower-level class. Since I_m′⊂I_m, every higher-level image column lies in F_m, so F_m′⊂F_m.
- Locally both modules are free of rank g over R with the same determinant ideal Hdg_T inside det ω. The determinant of the inclusion matrix is a unit: cancel a regular generator of Hdg_T in the equality of determinant ideals.
- The adjugate then inverts the inclusion matrix. Hence the two submodules are equal, and R2 transfers this explicit equality to O⁺.

**Acceptance instances.**

- At w=0 both lattices equal ω; compatible reductions without equal regular determinant ideals do not imply equality.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice`
- `HodgeTateAndCanonicalSubgroups:T0/finite-hodge-tate-naturality`
- `AdicSpacesPartII:R2`

**Source matches.**

- AIPH, §4.1, Proposition 4.1, PDF pp. 15–16; §4.3.1, Proposition 4.7, PDF p. 18: The local generator/determinant calculation supplies the inputs; the latter result compares weight sheaves, so the lattice equality requires the stated separate argument.

### T5/hodge-tate-aip-lift — The Hodge–Tate lift to the AIP torsor

**Lemma** · proposed name `TauCeti.HodgeTate.hodgeTate_aipLift` · implementation unchecked.

For ε≤p^{−(m+1)}, the canonical section s=HT(α(e₁)) on the anticanonical full-level tower factors through the AIP torsor F_m over its Igusa generator map φ. This is a factorization into the actual open subspace of the total Hodge bundle.

**Hypotheses.**

- Require the full one-motive boundary map, the finite-module generator theorem, the matrix lift assertion and its integral analytic transfer.
- Use the dual-abelian frame convention α′=α∘γ^∨ consistently.

**Proof route.**

- The dual canonical quotient of α(e₁) is the Igusa generator ψ by anticanonicity.
- Finite character naturality identifies s with a lift of HT(ψ(1)). The difference of any two such lifts lies in I_mω⁺⊂I′_mω^int.
- The congruence defining F_m therefore holds. Its generator condition gives the map to the open total-space subdomain; the site/open-subspace criterion is supplied by the analytic geometry owner.

**Acceptance instances.**

- On the ordinary modular cusp this is the dt/t generator with its Igusa congruence, not a trivialization of the whole Tate module.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T5/igusa-full-level-comparison`
- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties`
- `HodgeTateAndCanonicalSubgroups:T0/finite-hodge-tate-naturality`
- `HodgeTateAndCanonicalSubgroups:T2/open-tower-levi-pullback`

**Source matches.**

- BHW, §7.2, Proposition 7.11, PDF p. 30: Naturality of the character map makes the canonical HT section a lift of the Igusa generator.

### T5/aip-automorphy-factor — The AIP automorphy factor

**Lemma** · proposed name `TauCeti.HodgeTate.aip_automorphyFactor` · implementation unchecked.

For γ∈Γ₀(p) acting on the anticanonical tower with the fixed left-coordinate convention, γ*s=(cz+d)s and the scalar j(γ,x)=cz(x)+d is a section of the actual AIP structure group B_m. Its scalar cocycle is the period-coordinate cocycle.

**Hypotheses.**

- Require that the Γ₀(p) action preserves the anticanonical domain and that F_m→X(ε) is the faithfully acting B_m-torsor open in the total line bundle.
- In the Hilbert case use the actual O_F-linear torsor before any generic σ-projection.

**Proof route.**

- The coordinate action computes γ*s=j(γ,−)s, as in BHW Lemma 5.31 (the elliptic version is Lemma 3.19).
- Both s(x) and s(γx) lie in F_m above the same underlying abelian point by T5/hodge-tate-aip-lift. The torsor property gives a unique ratio b∈B_m, functorially over a common trivializing cover.
- The faithful scalar embedding in the total line bundle identifies b with j. Uniqueness glues the ratio and gives an analytic B_m-valued morphism. This repairs BHW Lemma 7.12 without using the reversed bound (7.1).

**Acceptance instances.**

- At an ordinary elliptic point the ratio is a unit in ℤ_p^×(1+p^mO⁺); the larger ambient ball bound alone cannot certify membership in this smaller group.

**Inputs.**

- `HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift`
- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor`
- `HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate`

**Source matches.**

- BHW, §5.4, Lemma 5.31, PDF p. 26; §7.2, Lemma 7.12, PDF p. 31: The scalar transformation formula and torsor diagram; the ratio proof replaces the invalid ambient-radius inclusion.

**Coverage: planned.**

- Normalized PEL model, coefficient and determinant descent: The E27 source-error allegation remains rejected. Lan Definition 8.5/Theorem 8.7, read with the author’s errata, cover normalized ramified models and nonflat coefficient algebras under their stated assumptions. C5 must identify the exact GSp₄/F model and formally canonical coefficient, verify the dimension exception, and separately supply the mod-p^k pushforward/projection formula and determinant/norm descent. C6 HBAV models do not discharge this request.
- Formal matrices, common level models and integral O⁺ transfer: AIPH Proposition 4.1 supplies the formal matrix/adjugate proof. R2/H4 must expose its exact normal admissible model, compatible generators and integral generic-fibre transfer preserving those matrices and inverses. The separate inclusion/determinant-cancellation proof establishes level independence once this common model is available; AIPH Proposition 4.7 alone compares weight sheaves.
- Modified strict transforms, Hilbert–Siegel coefficient charts and p=2 estimate: Use PS16’s successive minor modifications and the strict image, and BCGP’s placewise construction only with its integral coefficient presentations supplied. PS16 Remark 1.10 reports the p=2 exponent 2 as an unwritten communication; obtain a verified boundary estimate before asserting that variant. Keep its level conventions separate from strict n>b and retain the étale, rather than analytic-site, O⁺ sheaf.
- Effective integral coefficient descent and finite-level AIP restrictions: The HT lift and actual B_m-valued automorphy factor are planned separately, with a torsor-ratio repair of Lemma 7.12. P9 must supply effective continuous descent and O⁺ invariants on the bounded coefficient-base product. O5 supplies the independent AIP coefficients and AIPH Theorem 6.7(3) finite AL_n/forgetful restriction comparison; O6 supplies p-Hecke with changed radii. No AL_∞ is asserted. O5’s full finite-character integral generator/unit-pullback and common admissible coordinate-domain comparison remain missing. The all-unit supremum and analytic-radius formulas are false; correcting the level index alone does not supply a positive-radius comparison.

## Requests to existing owners

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2

Supply Frobenius/Verschiebung and Hasse/dual-Hasse theory of a BT₁ over an arbitrary F_p-scheme, with the LF isomorphism, quasi-polarization compatibility and the BT₁ character sequence. Its last semilinear map is F−HW(G^D), not bare Frobenius (HALO Appendix A.3, equation (6); FAR11 §2.1.2). T0 imports this input and proves the semi-abelian boundary application. Extend the existing field-only F/V contract explicitly. Also supply the general normalized determinant pullback for multiplicative p-divisible isogenies (PIL20 Lemma 6.3.4.1, PDF p.34): use the character lattice, factor only its determinant as p^r times a unit, normalize over ℤ_p before base change, and prove étale descent. T0 imports it for boundary charts. Supply the Hasse section’s Frobenius tensor-power compatibility on that quotient.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-hasse-invariant`
- `HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-ordinary-locus`
- `HodgeTateAndCanonicalSubgroups:T3/hasse-neighbourhood`
- `HodgeTateAndCanonicalSubgroups:T0/normalized-multiplicative-pullback`
- `HodgeTateAndCanonicalSubgroups:T3/pointwise-quotient-hasse`

### AbelianSchemesAndArithmeticModuli:A2

Abelian schemes over a general base with their dual abelian scheme, Frobenius and Verschiebung isogenies (V the dual of Frobenius of the dual), and polarisations.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-hasse-invariant`
- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`

### AbelianSchemesAndArithmeticModuli:A3

The Weil pairing e_n: A[p^n] × A^∨[p^n] → μ_{p^n} identifying A[p^n]^D with A^∨[p^n], with its sign convention and compatibility with polarisations; p-power torsion of abelian schemes as p-divisible groups.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T0/hodge-tate-map-compatibilities`
- `HodgeTateAndCanonicalSubgroups:T2/abelian-hodge-tate-sequence`
- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-properties`

### AbelianSchemesAndArithmeticModuli:A4

H¹_dR(A/S) of an abelian scheme with its Hodge filtration 0 → ω_A → H¹_dR → Lie(A^∨) → 0 and Gauss–Manin connection, and the Hodge filtration triangle for an isogeny used in Fargues's δ_G + δ_{G^D} = div|G|. Include H¹(A,𝒪_A)=Lie(A^∨) and H⁰(A,Ω¹_A)=ω_A with duality and endomorphism compatibility for the absolute sequence.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree-properties`
- `HodgeTateAndCanonicalSubgroups:T1/abelian-relative-comparison`
- `HodgeTateAndCanonicalSubgroups:T2/abelian-hodge-tate-sequence`

### PadicHodgeTheory:P8

For algebraizable proper smooth families on smooth adic spaces over a complete DVR field, supply the filtered horizontal relative comparison with its local-system finiteness hypothesis (CS17 Theorem 2.2.2), the horizontal lattices M and M₀, intersection filtration and graded/edge maps (Proposition 2.2.3, Corollary 2.2.4, Proposition 2.2.5). Supply the degree-one relative Kummer/character compatibility whose good-reduction pointwise form is CDM12 Proposition 4.15; distinguish B_dR from OB_dR and track the Weil/Tate duality. CP.1’s AΩ specialization and ordinary-point density do not supply this map. Separately supply the absolute degree-one proper smooth algebraic Hodge–Tate spectral sequence over arbitrary complete algebraically closed C, its algebraic degeneration (CDM12 Theorem 3.20/Remark 3.21, PDF p.20), functoriality and cup-product duality. This is independent of the relative K-descent contract.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T1/abelian-relative-comparison`
- `HodgeTateAndCanonicalSubgroups:T1/hodge-tate-graded-comparison`
- `HodgeTateAndCanonicalSubgroups:T2/relative-hodge-tate-sequence`
- `HodgeTateAndCanonicalSubgroups:T2/abelian-hodge-tate-sequence`

### ShimuraCompactifications:C5

For the exact normalized GSp₄/F full-level toroidal model and its normal minimal Stein model, identify them with Lan’s models and prove ω/p^n is formally canonical in Definition 8.5; apply Theorem 8.7 with O⊗Q simple and its dimension-one exception. Separately supply f_*O/p^k≅f_*(O/p^k), the projection formula and the integral determinant/norm descent required by PS16 Corollary 1.7/A.10 and BCGP §6.2.1. Lan’s ramified/arbitrary-coefficient theorem is valid; these concrete model/coefficient and pushforward verifications are the missing application. C6’s HBAV minimal model is not the Hilbert–Siegel compactification.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T0/hodge-tate-boundary-extension`
- `HodgeTateAndCanonicalSubgroups:T5/modified-minimal-model`

### HilbertModularVarietiesAndShimuraCurves:H2

Supply the total Hasse ideal and normal admissible Hilbert formal neighborhoods, and the O_F-linear canonical-module/dual-type theorem including the unsplit ramified generator. Cover separately the all-prime formal radius ε≤p^{−(n+1)} and the geometric-point BHW position radius w≤1/(c_p p^{n−1}), c_p=2,3,4. The latter needs the precise conormal/kernel estimates, including the p≥3 inclusive endpoints absent from FAR11’s strict HN theorem. HALO covers the p=2 endpoint via w≤1/2^{n+1}. Stability and underlying ℤ/p^n rank do not prove O_F/p^n freeness.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T3/hasse-neighbourhood`
- `HodgeTateAndCanonicalSubgroups:T3/hilbert-canonical-subgroup`
- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-hodge-tate`
- `HodgeTateAndCanonicalSubgroups:T4/canonical-kernel-congruence`
- `HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions`
- `HodgeTateAndCanonicalSubgroups:T4/ramified-period-comparison`
- `HodgeTateAndCanonicalSubgroups:T2/open-tower-levi-pullback`

### HilbertModularVarietiesAndShimuraCurves:H4

Supply the full-level and Γ₀ subgroup moduli in BHW’s dual-abelian convention, including the unsplit O_F/p^n canonical generator and polarization ideal. Specify α′=α∘γ^∨ with γ^∨=det(γ)γ^{−1}, the first-vector quotient generator, and reduction maps. A Γ₀ quotient forgets the generator and therefore does not factor the Igusa map φ. Retain the exact coefficient field and Γ versus Γ* variants.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci`
- `HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate`
- `HodgeTateAndCanonicalSubgroups:T5/igusa-full-level-comparison`
- `HodgeTateAndCanonicalSubgroups:T5/aip-hodge-tate-comparison`
- `HodgeTateAndCanonicalSubgroups:T3/hilbert-canonical-subgroup`
- `HodgeTateAndCanonicalSubgroups:T4/ramified-period-comparison`
- `HodgeTateAndCanonicalSubgroups:T2/open-tower-levi-pullback`

### PerfectoidSpaces:P9

For the anticanonical pro-étale full-level torsor over Γ₀*(p^n) and its product with the bounded weight affinoid, supply effective continuous descent for the actual completed coefficient O⁺-sheaf, equality of its invariants with the base sheaf, and preservation of invertible modules. State the adic/diamond site, the completed tensor convention and topological coefficient hypotheses, as required by BHW Lemma 3.7/Theorem 7.14. This is stronger than a bare diamond torsor or rational O invariant statement. For T2’s open tower also supply functorial completed pullback of the finite-level relative tensor filtration and adapted frame/Levi torsors to every perfectoid untilt mapping to the limit sheaf, with locally free descent and compatibility with the analytic flag functor of D6. This is not supplied by a field-point calculation or an O⁺ invariant-ring statement alone.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T5/aip-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/aip-hodge-tate-comparison`
- `HodgeTateAndCanonicalSubgroups:T2/open-tower-hodge-tate-map`
- `HodgeTateAndCanonicalSubgroups:T2/open-tower-levi-pullback`

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1

Extend p-divisible conormal/dimension and finite-level reduction to O_C (C complete algebraically closed, v(p)=1): ω_{G[p^n]}≅ω_G/p^n, dim G+dim G^D=height G and p-adic completeness. Supply the integral Faltings complex with zero composite and cohomology killed by every a of v(a)≥1/(p−1), as restated in CDM12 Theorem 4.13. State the exact hypotheses for embedding a finite flat p-primary O_C-group in a p-divisible group. Supply cyclic presentations and Fitting degree for finitely presented torsion modules over rank-one valuation rings, with presentation independence. The existing complete-noetherian-local dimension and small-ramification uniqueness results are insufficient. Supply the BT quotient p^{−a}D/D at the required truncation level for a supplied finite-flat subgroup D, its height/dimension and reduction/conormal compatibility (FAR11 Theorem 5 proof and Theorem 6 induction, PDF pp.37–39).

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T0/conormal-module`
- `HodgeTateAndCanonicalSubgroups:T0/p-divisible-hodge-tate-map`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-hodge-tate-cokernel`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree-properties`
- `HodgeTateAndCanonicalSubgroups:T2/p-divisible-hodge-tate-sequence`
- `HodgeTateAndCanonicalSubgroups:T2/abelian-hodge-tate-sequence`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree`
- `HodgeTateAndCanonicalSubgroups:T3/pointwise-quotient-hasse`
- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-theorem`

### ShimuraCompactifications:C4

On the actual normalized full-level degeneration charts, supply the polarized one-motive [Y→G̃], its pairing/finite locally free torsion and integral overlap/cone-refinement morphisms. Distinguish the torus character lattice from Y. Supply relative Verschiebung on smooth commutative semi-abelian schemes over arbitrary F_p-bases and its base-change/Raynaud compatibility. Retain the existing C4 good-prime and admissible-fan restrictions. Finite-flat Cartier duality does not apply to the whole quasi-finite boundary G[p^n]. For T0’s normalized-pullback application provide compatible multiplicative pieces/isogenies and their étale character lattices on the boundary charts.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-torsion`
- `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-hasse-invariant`
- `HodgeTateAndCanonicalSubgroups:T0/hodge-tate-boundary-extension`
- `HodgeTateAndCanonicalSubgroups:T0/normalized-multiplicative-pullback`

### NeronModelsAndSemistableAbelianVarieties:R11.3

Supply semistable existence/effective descent for arbitrary C-points, or an O_C Raynaud extension and uniformization theorem, with its dual polarized one-motive and Tate/differential comparison. An arbitrary abelian variety over C need not descend to a finite extension of Q_p. Existing complete-DVR uniformization and a semistable characterization do not establish this existence statement.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T0/raynaud-hodge-tate-filtration`
- `HodgeTateAndCanonicalSubgroups:T2/abelian-hodge-tate-sequence`

### AutomorphicBundles:B1

Supply the rational homology tensor/frame convention, actual opposed-parabolic de Rham Levi torsor and its central cocharacter. Expose the contracted product with the Tate-basis ℤ_p^×-torsor so the graded comparison descends to the μ-twisted torsor, as in Boxer–Pilloni Remark 4.4.23, not an unconditional untwisted identification. Preserve determinant local systems and Hecke linearizations. For integral frames specify a stable tensor lattice and integral reductive model separately.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T1/hodge-tensor-comparison`
- `HodgeTateAndCanonicalSubgroups:T2/pel-hodge-type-filtration`
- `HodgeTateAndCanonicalSubgroups:T2/hodge-tate-parabolic-reduction`
- `HodgeTateAndCanonicalSubgroups:T2/de-rham-hodge-tate-levi-comparison`

### OverconvergentAutomorphicForms:O6

Prove p-Hecke compatibility of the AIP–Hodge–Tate coefficient comparison, including changed Hasse radii, dual-isogeny pullbacks and integral normalisation factors. T5 constructs the torsor comparison, not the Hecke operators.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T5/aip-hodge-tate-comparison`

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6

Import the full cotangent/square-zero deformation theory from DerivedDeRhamCohomology DD.0; specialize to co-Lie complexes of flat commutative groups. Supply syntomicity/perfect amplitude [−1,0], determinant–Fitting comparison, additivity, duality δ_G+δ_GD=div(rank G), trace codifferent duality (FAR10 Proposition 1), and Illusie’s homomorphism/subgroup lifting obstruction with its functorial transition along square-zero thickenings (SCH15 III.2.2; HALO Proposition A.1). Do not treat a Kähler module or a determinant of an endomorphism as this theory.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree-properties`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree-generic-isomorphism`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-divisor`
- `HodgeTateAndCanonicalSubgroups:T0/degree-different`
- `HodgeTateAndCanonicalSubgroups:T3/subgroup-lifting`

### AlgebraicModuliForArithmeticGeometry:R09.1

Supply the relative rank-g quotient/flag scheme, universal quotient bundle and descended flag form over the reflex field, with pullback and representability. The Mathlib Module.Grassmannian carrier is an affine-module component, not already the analytic flag scheme or its tautological bundle. Include the homogeneous torsor G→G/P_HT and its actual Levi quotient G/U_HT→G/P_HT, with universal frame pullback and associated bundles; use B0’s opposed-parabolic convention. The generic interface cannot be imported from downstream S3.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T2/hodge-tate-flag-point`
- `HodgeTateAndCanonicalSubgroups:T2/pel-hodge-type-filtration`
- `HodgeTateAndCanonicalSubgroups:T2/hodge-tate-parabolic-reduction`
- `HodgeTateAndCanonicalSubgroups:T2/open-tower-hodge-tate-map`
- `HodgeTateAndCanonicalSubgroups:T2/open-tower-levi-pullback`

### AdicSpacesPartII:R2

Supply the integral generic-fibre/pullback theorem for coherent finite locally free sheaves, their explicit matrix maps and quotients on normal admissible p-torsion-free formal Hilbert charts. It must identify the formal and analytic O⁺ character maps and preserve the local generator/inverse matrices of AIPH Proposition 4.1. Also supply normalization of the relevant formal models and strict transform/image under admissible blowups. The ordinary generic-fibre equivalence or rank-one point checking alone does not establish this O⁺ identification. For a formal canonical-locus version specify a common admissible base model, its compatible normalization in the finite cover and prove the canonical section extends as an isomorphism of its formal component.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-hodge-tate`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties`
- `HodgeTateAndCanonicalSubgroups:T5/modified-hodge-bundle`
- `HodgeTateAndCanonicalSubgroups:T5/modified-minimal-model`
- `HodgeTateAndCanonicalSubgroups:T4/canonical-locus-isomorphism`

### OverconvergentAutomorphicForms:O5

Supply the independently constructed AIP weight sheaf from F_m and its bounded smooth character, with an actual admitted AIP coordinate/level/radius chart, completed integral coefficients, local invertible generators and AIPH Theorem 6.7(3) finite-level AL_n/forgetful restriction comparison. T5 supplies the torsor/HT identification rather than constructing these coefficients twice. Use the reviewed universal-coordinate domain intersection, not the printed all-unit supremum, analytic-radius formula or a universal k+r−1 repair. Supply a local integral eigenfunction generator with unit HT pullback for the full finite-character factor and its transition units. Keep formal coherence separate from analytic O⁺ invertibility; use AL_1 on both sides at n=0.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T5/aip-hodge-tate-comparison`

## Recorded gaps and follow-up

### 1. Group co-Lie deformation and trace duality

R07.6 owns the finite-flat group specialization of DD.0’s full cotangent and obstruction theory, syntomic determinant and trace duality. Read FAR10 §1–§2, SCH15 III.2.2 and HALO A.1 give the consequences used here; Illusie II is not cleared and its foundation is not independently verified. The Fitting definition of degree does not remove this lifting input.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T0/fargues-divisor`
- `HodgeTateAndCanonicalSubgroups:T0/degree-different`
- `HodgeTateAndCanonicalSubgroups:T3/subgroup-lifting`

### 2. Valuation-ring Fitting and the integral O_C Faltings complex

Import the StableReduction general Fitting direction, and request its nonnoetherian finite-presentation valuation specialization from R07.1. CDM12 Theorem 4.13 independently supplies the bounded integral complex and zero composite; R07.1’s existing complete-noetherian-local dimension statements do not cover O_C, and its finite-to-p-divisible embedding must have exact hypotheses.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T0/conormal-module`
- `HodgeTateAndCanonicalSubgroups:T0/p-divisible-hodge-tate-map`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-hodge-tate-cokernel`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree-properties`
- `HodgeTateAndCanonicalSubgroups:T2/p-divisible-hodge-tate-sequence`

### 3. Boundary one-motives and arbitrary-C Raynaud realization

C4 supplies polarized [Y→G̃], the finite-flat torsion pieces and integral overlap uniqueness, plus arbitrary-base semi-abelian Verschiebung. R11.3 supplies the descent/existence or complete-C uniformization extension beyond its current DVR statements. Boundary coordinate estimates use the full height-2g dual one-motive realization, not the smaller finite Raynaud group.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-torsion`
- `HodgeTateAndCanonicalSubgroups:T0/hodge-tate-boundary-extension`
- `HodgeTateAndCanonicalSubgroups:T0/raynaud-hodge-tate-filtration`
- `HodgeTateAndCanonicalSubgroups:T2/abelian-hodge-tate-sequence`
- `HodgeTateAndCanonicalSubgroups:T4/canonical-kernel-congruence`

### 4. Normalized PEL model, coefficient and determinant descent

The E27 source-error allegation remains rejected. Lan Definition 8.5/Theorem 8.7, read with the author’s errata, cover normalized ramified models and nonflat coefficient algebras under their stated assumptions. C5 must identify the exact GSp₄/F model and formally canonical coefficient, verify the dimension exception, and separately supply the mod-p^k pushforward/projection formula and determinant/norm descent. C6 HBAV models do not discharge this request.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T0/hodge-tate-boundary-extension`
- `HodgeTateAndCanonicalSubgroups:T5/modified-minimal-model`

### 5. Relative character comparison and Tate-normalized rational tensors

P8 supplies the two horizontal B_dR^+ lattices and relative Kummer edge-map compatibility of CS17 §2.2; CDM12 Proposition 4.15 is the independently read good-reduction pointwise reference. B1 supplies rational defining tensors and central-μ contraction with the Tate-basis torsor. CS17’s raw untwisted conclusion is corrected by Boxer–Pilloni §4.4.8/Remark 4.4.23 (E31). General-C families outside the stated K-descent hypothesis and integral G_ℤp frames require separate extensions. P8 also supplies the absolute arbitrary-C algebraic degree-one spectral sequence and A4 its H¹O/invariant-differential identifications; this does not assume finite-Q_p descent.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T1/hodge-tate-graded-comparison`
- `HodgeTateAndCanonicalSubgroups:T1/hodge-tensor-comparison`
- `HodgeTateAndCanonicalSubgroups:T2/relative-hodge-tate-sequence`
- `HodgeTateAndCanonicalSubgroups:T2/de-rham-hodge-tate-levi-comparison`
- `HodgeTateAndCanonicalSubgroups:T2/abelian-hodge-tate-sequence`

### 6. Shared filtered-Tannakian Part II and representable torsors

Ziegler Definition 3.4, Theorems 3.14–3.15 and 3.52 establish the precise algebraic strict/fpqc statements. The proposed ReductiveGroups Part II extension must expose them. R09.1/B0 supply the representable flag and actual parabolic quotient; pinned dynamic point subgroups are insufficient. CS17’s separate pro-étale type argument governs the Shimura application.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T2/filtered-fibre-functor`
- `HodgeTateAndCanonicalSubgroups:T2/pel-hodge-type-filtration`
- `HodgeTateAndCanonicalSubgroups:T2/hodge-tate-parabolic-reduction`

### 7. Inclusive geometric endpoint and ramified canonical generator

HALO Appendix A independently covers p=2 and the small all-prime formal radius, including the strict weak-bound inequality at its endpoint. The larger BHW pointwise radius still needs its p≥3 inclusive-endpoint refinement and exact unsplit O_F/p^n dual generator from H2/H4. The scalar kernel/degree argument and generic projection are separated; neither stability nor a generic decomposition proves integral O_F freeness.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T3/hilbert-canonical-subgroup`
- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-hodge-tate`
- `HodgeTateAndCanonicalSubgroups:T4/canonical-kernel-congruence`
- `HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions`
- `HodgeTateAndCanonicalSubgroups:T4/ramified-period-comparison`

### 8. Formal matrices, common level models and integral O⁺ transfer

AIPH Proposition 4.1 supplies the formal matrix/adjugate proof. R2/H4 must expose its exact normal admissible model, compatible generators and integral generic-fibre transfer preserving those matrices and inverses. The separate inclusion/determinant-cancellation proof establishes level independence once this common model is available; AIPH Proposition 4.7 alone compares weight sheaves.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`
- `HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties`
- `HodgeTateAndCanonicalSubgroups:T5/integral-lattice-level-independence`

### 9. Modified strict transforms, Hilbert–Siegel coefficient charts and p=2 estimate

Use PS16’s successive minor modifications and the strict image, and BCGP’s placewise construction only with its integral coefficient presentations supplied. PS16 Remark 1.10 reports the p=2 exponent 2 as an unwritten communication; obtain a verified boundary estimate before asserting that variant. Keep its level conventions separate from strict n>b and retain the étale, rather than analytic-site, O⁺ sheaf.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T5/modified-hodge-bundle`
- `HodgeTateAndCanonicalSubgroups:T5/modified-minimal-model`
- `HodgeTateAndCanonicalSubgroups:T5/modified-plus-sheaf`

### 10. Effective integral coefficient descent and finite-level AIP restrictions

The HT lift and actual B_m-valued automorphy factor are planned separately, with a torsor-ratio repair of Lemma 7.12. P9 must supply effective continuous descent and O⁺ invariants on the bounded coefficient-base product. O5 supplies the independent AIP coefficients and AIPH Theorem 6.7(3) finite AL_n/forgetful restriction comparison; O6 supplies p-Hecke with changed radii. No AL_∞ is asserted. O5’s full finite-character integral generator/unit-pullback and common admissible coordinate-domain comparison remain missing. The all-unit supremum and analytic-radius formulas are false; correcting the level index alone does not supply a positive-radius comparison.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T5/aip-hodge-tate-comparison`

### 11. Siegel consumer domain refinement

The OverconvergentAutomorphicForms O8 request for the p>2g Siegel DRW §3.6 domain comparison needs its source read and exact comparison hypothesis. The present nodes cover the assigned general canonical and period-position targets; this additional consumer refinement is not established.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-theorem`
- `HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions`

### 12. Formal canonical-locus model identification

The adic canonical component is a finite-étale section. R2 must identify compatible normalized formal models over one common base before this strengthens to a formal isomorphism; generic-fibre isomorphism and normalization alone are insufficient.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T4/canonical-locus-isomorphism`

### 13. Open-tower relative filtration transfer

S0’s existing limit v-sheaf and action statements were read, as was D6’s diamond functor. P9 must expose functorial completed relative filtration/frame pullback on all perfectoid test untilts and effective locally free/Levi descent, compatible with the universal flag. This exact interface is not the existing coefficient-product invariant-ring contract. R09.1/B0 must expose the homogeneous Hodge–Tate flag/Levi universal torsor upstream of S3. Neither perfectoid representability nor geometric-point evaluation substitutes for these inputs.

**Required by.**

- `HodgeTateAndCanonicalSubgroups:T2/open-tower-hodge-tate-map`
- `HodgeTateAndCanonicalSubgroups:T2/open-tower-levi-pullback`

## Source-issue ledger

Every issue below was reassessed independently for revision 2. Fourteen of the original fifteen assessments are confirmed; E27 is rejected as a source mistake, with its application gap retained. E29–E30 import and independently verify O0’s existing diagnostics; E31 independently confirms the Levi twist diagnostic of PerfectoidShimuraVarieties/E21 against both CS17 versions and the revised Boxer–Pilloni manuscript. These are paraphrased claims, not source quotations.

### HodgeTateAndCanonicalSubgroups/E14 — FAR10

**Locator.** §3, Définition 5, PDF p. 9 (author copy)

**Claim examined.** The definition gives the scaling correction with a positive sign and omits the ambient dimension.

**Correct statement.** For Λ₂⊂Λ₁ use v(Fitt₀(Λ₁/Λ₂)); for a general pair subtract k·dim_K V from χ(Λ₁,p^kΛ₂).

**Reason.** By additivity χ(Λ₁, p^kΛ₂) = χ(Λ₁, Λ₂) + k·dim V, so the printed sign and the missing factor dim V are wrong; the printed quotient Λ₂/Λ₁ should be Λ₁/Λ₂. Proposition 3 uses only the case Λ₂ ⊂ Λ₁.

**Independent verdict: confirmed.** Confirmed in FAR10 Definition 5: rank-r scaling adds kr to χ, so the compensating sign is minus and the factor r is necessary; the quotient for Λ₂⊂Λ₁ is Λ₁/Λ₂. Reviewed by `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

### HodgeTateAndCanonicalSubgroups/E15 — FAR10

**Locator.** §4.3, Corollaire 5(5), PDF p. 12 (author copy)

**Claim examined.** The generic-isomorphism condition names G as the target rather than the group G″ in the hypothesis.

**Correct statement.** Use the generic isomorphism G/G′→G″.

**Reason.** The hypothesis concerns the map to G″, as in Corollaire 3(b); G/G′ → G is not defined.

**Independent verdict: confirmed.** Confirmed in FAR10 Corollary 5(5): the generic quotient in the asserted filtration is G″, not G. The corrected statement matches the surrounding exact sequence. Reviewed by `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

### HodgeTateAndCanonicalSubgroups/E16 — FAR11

**Locator.** §6.6, Proposition 11, PDF p. 34 (author copy)

**Claim examined.** The two prime cases are printed inconsistently with the adjacent canonical-subgroup bounds.

**Correct statement.** Under p≠2, use Ha(G)<1/2 for p≠3 and Ha(G)<1/3 for p=3.

**Reason.** Corollaires 1 and 2 on the same page and Théorème 4 use 'si p ≠ 3'; with 'p ≠ 2' the two cases overlap at p = 3.

**Independent verdict: confirmed.** Confirmed in FAR11 Proposition 11 (§6.6): in the standing p≠2 context the displayed branch must read p≠3, separating the p=3 case. Corrected the section locator. Reviewed by `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

### HodgeTateAndCanonicalSubgroups/E17 — FAR11

**Locator.** §5.4, before Théorème 3, PDF p. 25 (author copy)

**Claim examined.** The comparison with the 2010 paper points to its sixth theorem.

**Correct statement.** The intended reference is FAR10 Theorem 7.

**Reason.** Théorème 3 is Théorème 7 of Fargues 2010; Théorème 6 there is the HN/HT polygon comparison. §5 of the same paper cites 'théorème 7 de [16]' correctly.

**Independent verdict: confirmed.** Confirmed: FAR11 Theorem 3’s cokernel argument is FAR10 Theorem 7, whereas Theorem 6 is the triple equivalence. Reviewed by `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

### HodgeTateAndCanonicalSubgroups/E18 — FAR11

**Locator.** §7.5, proof of Théorème 6, PDF p. 38 (author copy)

**Claim examined.** The inductive truncated BT quotient is written with C before that subgroup has been constructed.

**Correct statement.** In the level-(n−1) induction use p^{−(n−1)}D/D, where D is the already constructed level-one subgroup, instead of a quotient written with the as-yet unconstructed C.

**Reason.** C is defined in the next sentence from the induction hypothesis applied to p^{−(n−1)}D/D (D the canonical subgroup of G[p]).

**Independent verdict: confirmed.** Confirmed in FAR11 Theorem 6 proof, PDF p.38: the level-(n−1) quotient must be p^{−(n−1)}D/D. Merely writing G/D suppresses the necessary truncation. Reviewed by `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

### HodgeTateAndCanonicalSubgroups/E19 — BP26

**Locator.** §4.1.8, PDF p. 41 (author copy)

**Claim examined.** The divisor duality identity is attributed to the wrong numbered lemma in FAR10.

**Correct statement.** Use FAR10 §2, Lemma 2 for δ_G+δ_GD=div|G|; Lemma 3 is base change.

**Reason.** Lemme 3 of Fargues 2010 is flat base change δ_{h*G} = h*δ_G; the duality identity is Lemme 2.

**Independent verdict: confirmed.** Confirmed in BP26 §4.1.8: degree duality is Lemma 2, not Lemma 3. Reviewed by `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

### HodgeTateAndCanonicalSubgroups/E20 — BHW

**Locator.** §7.1, after Definition 7.5, display (7.1), PDF p. 29 (arXiv:1902.03985v4)

**Claim examined.** Display (7.1) places the fixed-radius ambient unit group inside B_m; Lemma 7.12 uses this direction.

**Correct statement.** On X(ε), B_m is contained in the ambient O_p^×(1+p^x Res Ĝ_a), with equality only at the extremal height. Prove j∈B_m by the ratio of the two AIP torsor lifts, as in T5/aip-automorphy-factor.

**Reason.** The actual inverse Hasse ideal is contained in the fixed-radius scalar ideal, which reverses the printed inclusion. Once both canonical HT sections lift to the same B_m-torsor, their unique torsor ratio equals cz+d by its faithful scalar action. This supplies the structure-group membership without the invalid inclusion.

**Independent verdict: confirmed.** Confirmed in arXiv v4 and the published BHW equation (7.1). Pointwise height w≤ε gives v(I′_m)=m−p^m w/(p−1)≥x, hence I′_m⊂(p^x). This does not by itself verify the subsequent automorphy-factor argument. Reviewed by `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

### HodgeTateAndCanonicalSubgroups/E21 — BHW

**Locator.** §7.1, Lemma 7.2, PDF p.29 (arXiv:1902.03985v4)

**Claim examined.** The middle term in Lemma 7.2 is declared exact with the total-Hasse ideal I_m.

**Correct statement.** The conormal projection kernel is contained in I_mω⁺, so the quotient map factors through ω_Hm. Equality of that kernel with I_mω⁺ is unnecessary and fails in dimension greater than one.

**Reason.** For g ≥ 2, deg ω_{A[p^m]/H_m} = ((p^m−1)/(p−1))ε in total (Fargues), while I_mω⁺/p^m has degree g(p^m−1)ε/(p−1), so ker π ≠ I_mω⁺. Only the factorisation is used afterwards, in Definition 7.3 and Corollary 7.6.

**Independent verdict: confirmed.** Confirmed in arXiv v4 and published BHW Lemma 7.2. For dimension g>1, equality of the kernel with I_mω⁺ would force deg ω_{H_m}=g(m−δ), contradicting deg H_m=mg−δ when δ>0. The needed weaker containment ker π⊂I_mω⁺ still requires the canonical-subgroup differential theorem. Reviewed by `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

### HodgeTateAndCanonicalSubgroups/E22 — BHW

**Locator.** §5.2, PDF p. 21 (arXiv:1902.03985v4)

**Claim examined.** The introductory level-n Frobenius reduction uses the level-one precision 1−ε.

**Correct statement.** Use the supported precision 1−S_nε, S_n=(p^n−1)/(p−1). The stronger introductory precision has not been disproved here; it lacks the cited justification.

**Reason.** Confirmed as a mismatch with the cited canonical-subgroup bound: Proposition 5.19(1) states 1−δ, δ=ε(p^n−1)/(p−1), not 1−ε at level n. The stronger congruence is not disproved here; classified as a missing justification, not an established false theorem. The mismatch persists in the published §5.2.

**Independent verdict: confirmed.** Confirmed as a mismatch with the cited canonical-subgroup bound: Proposition 5.19(1) states 1−δ, δ=ε(p^n−1)/(p−1), not 1−ε at level n. The stronger congruence is not disproved here; classified as a missing justification, not an established false theorem. The mismatch persists in the published §5.2. Reviewed by `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

### HodgeTateAndCanonicalSubgroups/E23 — BHW

**Locator.** §5.3, proof of Proposition 5.18, PDF p. 24 (arXiv:1902.03985v4)

**Claim examined.** The proof identifies the integral ramified coefficient order with its product of embedding valuation rings.

**Correct statement.** First prove the scalar O_C kernel congruence and the unsplit canonical O_F/p^n generator. Project only on the generic fibre along σ and measure errors in the integral closure of O_p⊗O_C.

**Reason.** 𝒪_p ⊗_{ℤ_p} O_C ≅ O_C^Σ holds only for p unramified in F; for ramified p the left side is not integrally closed and V need not be locally free over 𝒪_p ⊗ O_C. The paper claims all p. Also noted by the PerfectoidShimuraVarieties packet (its E36).

**Independent verdict: confirmed.** Confirmed in arXiv v4 and published proof of Proposition 5.18: for ramified F the integral tensor order is not the product of O_C over embeddings. Generic projections and the normalisation must be distinguished; the repaired congruence argument remains a gap. Reviewed by `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

### HodgeTateAndCanonicalSubgroups/E24 — BHW

**Locator.** §7.2, Definition 7.9, arXiv v4 PDF p.30; published p.1761 (PDF p.54)

**Claim examined.** The weight-piece construction takes m=k+r and claims the needed canonical radius at that level.

**Correct statement.** Under the displayed scalar radius arithmetic, level k+r−1 covers the stated upper endpoint, whereas k+r need not. For an actual full-weight comparison use independently verified AIP coordinate/level conditions and a common admitted domain; the index change alone does not repair the weight-domain errors E29–E30.

**Reason.** On W*_k, v(δ_κ) ∈ [p^{−k}, p^{−(k−1)}], so ε_κ ∈ [p^{−(k+r+1)}, p^{−(k+r)}] while ε^can_{k+r} = p^{−(k+r+1)}: 'ε_κ ≤ ε^can_m' fails for m = k + r except at the boundary; AIP (Hilbert) §4.2 requires n ≤ r + k − 1.

**Independent verdict: confirmed.** Confirmed as a conditional arithmetic mismatch in Definition 7.9 (not Lemma 7.9). Its displayed interval allows ε=p^{−(k+r)}, exceeding ε_can(k+r)=p^{−(k+r+1)}. The scalar repair k+r−1 does not validate the printed diagnostic or analytic-extension formula. Reviewed by `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

### HodgeTateAndCanonicalSubgroups/E25 — BHW

**Locator.** §5.3, proof of Proposition 5.19, PDF p. 24 (arXiv:1902.03985v4)

**Claim examined.** The character/conormal estimate is assigned to AIP15 Proposition 3.2.2.

**Correct statement.** Its intended reference is AIP15 Proposition 3.2.1; Proposition 3.2.2 is a different truncated full-group statement.

**Reason.** The content of (2) and (3) is AIP Proposition 3.2.1 (isomorphism modulo p^{n−v(p^n−1)/(p−1)}, cokernel of degree v/(p−1)); Proposition 3.2.2 concerns HT of G[p^n] and needs v < (p−1)/(p(p^n−1)).

**Independent verdict: confirmed.** Confirmed in arXiv v4 and published Proposition 5.19(2): the differential and cokernel statement is AIP15 Proposition 3.2.1, not its 3.2.2. Reviewed by `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

### HodgeTateAndCanonicalSubgroups/E26 — BCGP21

**Locator.** §6.5.1, PDF p. 154 (arXiv:1812.09269v3)

**Claim examined.** The degree formula applies the valuation after reduction of each cyclic presentation entry modulo p.

**Correct statement.** Use the sum of v(x_i) in O_K, with no truncation at 1.

**Reason.** Subgroups not killed by p occur (M_{1,w} ⊂ 𝒢_w[p²] in Lemma 6.5.12), for which the truncated sum is not Fargues's degree; the PAPER-BOXER-CALEGARI-GEE-PILLONI-21 route already corrects the item statement.

**Independent verdict: confirmed.** Confirmed in BCGP arXiv v3 §6.5.1: evaluating v after reduction mod p truncates each elementary divisor at 1; μ_{p²} has ω=R/p² and degree 2, while the printed truncated sum gives 1. This review does not claim a collation with the published BCGP version. Reviewed by `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

### HodgeTateAndCanonicalSubgroups/E27 — BCGP21

**Locator.** §6.1.4, PDF p. 141 (arXiv:1812.09269v3)

**Claim examined.** The boundary-extension argument invokes Lan’s normalized-model Koecher theorem.

**Correct statement.** The independent review rejects this as a source error. Lan Definition 8.5 and Theorem 8.7 do allow normalized ramified models and arbitrary coefficient algebras. The remaining job is the exact model/coefficient application and separate mod-p^k pushforward verification.

**Reason.** Rejected as a source mistake. Lan Theorem 8.7 explicitly addresses normalised models and arbitrary coefficient algebras with formally canonical sheaves (Definition 8.5). A toroidal boundary divisor is not an obstruction to this theorem. The concrete model/coefficient and determinant-descent checks remain gaps in this packet.

**Independent verdict: rejected.** Rejected as a source mistake. Lan Theorem 8.7 explicitly addresses normalised models and arbitrary coefficient algebras with formally canonical sheaves (Definition 8.5). A toroidal boundary divisor is not an obstruction to this theorem. The concrete model/coefficient and determinant-descent checks remain gaps in this packet. Reviewed by `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

### HodgeTateAndCanonicalSubgroups/E28 — SCH15

**Locator.** §III.3, immediately before Lemma III.3.9, arXiv v2 PDF p. 58; published Annals p. 1008 (PDF p. 64)

**Claim examined.** The paragraph claims the full integral symplectic similitude group permutes the finite family of Plücker domains.

**Correct statement.** Use the all-g-subset cover of binomial(2g,g) domains and prove translate statements separately. A full GSp(ℤ_p) action need not permute these domains.

**Reason.** For g=1 the two charts are D₀={|z|≤1} and D∞={|z|≥1}. Under γ=(1 0;1 1), the image of D₀ contains 0 and ∞, so it equals neither chart. This checks the auxiliary assertion, not a counterexample to the period-map theorem.

**Independent verdict: confirmed.** The explicit g=1 matrix counterexample disproves permutation of the finite Plücker chart family; it occurs in both the arXiv and published text. Reviewed by `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

### HodgeTateAndCanonicalSubgroups/E29 — BHW

**Locator.** §6.1 after Definition 6.2, arXiv v4 PDF p.27; published p.1757 (PDF p.50)

**Claim examined.** The all-unit supremum is asserted to be less than one for every bounded weight.

**Correct statement.** Keep affinoid-image boundedness. A small principal-unit diagnostic may be useful, but quantitative AIP domains need independent universal-coordinate conditions.

**Reason.** For p>2 and F=ℚ, a nontrivial Teichmüller character is a bounded point of weight space and has |κ(ζ)−1|=1 on a prime-to-p root of unity. Its all-unit supremum is one, so the ensuing claimed positive ε_κ need not be positive.

**Independent verdict: confirmed.** For p>2 and F=ℚ, a nontrivial Teichmüller character is a bounded point of weight space and has |κ(ζ)−1|=1 on a prime-to-p root of unity. Its all-unit supremum is one, so the ensuing claimed positive ε_κ need not be positive. Reviewed by `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

### HodgeTateAndCanonicalSubgroups/E30 — BHW

**Locator.** §6.1, Proposition 6.3, arXiv v4 PDF p.27; published p.1757 (PDF p.50)

**Claim examined.** The common analytic radius is prescribed as the product |p|^r₀|T_κ|.

**Correct statement.** Use a genuine common analytic extension radius and AIP Proposition 2.8’s coordinate hypotheses. Changing the all-unit supremum to a pro-p supremum alone does not validate the product formula.

**Reason.** Take F=ℚ,p=3 and the finite character trivial on μ₂ with κ(4)=ζ₉. The pro-p supremum is 3^{−1/6}, so the claimed ball has radius 3^{−7/6}. It contains 64 because |64−1|₃=3^{−2}; κ(64)=ζ₃. But the kernel elements 4^{9·3^j} accumulate at 1 in the same ball. The analytic identity theorem would force an extension to equal 1 throughout it, contradicting the value at 64.

**Independent verdict: confirmed.** Take F=ℚ,p=3 and the finite character trivial on μ₂ with κ(4)=ζ₉. The pro-p supremum is 3^{−1/6}, so the claimed ball has radius 3^{−7/6}. It contains 64 because |64−1|₃=3^{−2}; κ(64)=ζ₃. But the kernel elements 4^{9·3^j} accumulate at 1 in the same ball. The analytic identity theorem would force an extension to equal 1 throughout it, contradicting the value at 64. Reviewed by `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

### HodgeTateAndCanonicalSubgroups/E31 — CS17

**Locator.** §2.3, Proposition 2.3.9/proof, arXiv v1 PDF p.21; published pp.673–674 (PDF pp.25–26)

**Claim examined.** The raw de Rham and Hodge–Tate Levi torsors are canonically identified without a central-cocharacter Tate twist.

**Correct statement.** Use ℳ_HT≅ℳ_dR×^{μ,ℤ_p^×}𝒯(1); an associated central-μ-weight-a bundle receives Tate twist (a). A chosen C-valued Tate basis provides an underlying untwisted identification with its transported linearization.

**Reason.** The comparison of graded pieces carries Tate weights. A basis on the Tate-trivialization torsor yields an isomorphism there, but a change of basis acts through central μ; descent gives the contracted product, not the raw de Rham torsor. Boxer–Pilloni §4.4.8/Remark 4.4.23 makes this explicit. The published CS17 proof retains the untwisted conclusion.

**Independent verdict: confirmed.** The comparison of graded pieces carries Tate weights. A basis on the Tate-trivialization torsor yields an isomorphism there, but a change of basis acts through central μ; descent gives the contracted product, not the raw de Rham torsor. Boxer–Pilloni §4.4.8/Remark 4.4.23 makes this explicit. The published CS17 proof retains the untwisted conclusion. Reviewed by `REV-HodgeTateAndCanonicalSubgroups--T0~2`.

## Routing and structure proposals

- **Bijakowski–Pilloni–Stroh 2016, item 10 (Fargues's degree):** Planned as T0/fargues-degree and T0/fargues-degree-properties from Fargues 2010 directly; the Annals PDF served by the publisher was a 6-page stub, so BPS's own text was not read; its use is the degree of Fargues 2010, which is read.
- **Boxer–Pilloni 2026, items fargues-degree-divisor, fargues-degree-comparison-generic-isomorphism, fargues-degree-of-truncated-BT-and-extreme-values:** T0/fargues-divisor, T0/fargues-degree-generic-isomorphism, T0/fargues-degree-properties. In the author copy read, the divisor of an isogeny via det Lie(f) is not in Boxer–Pilloni; it is planned from Pilloni 2020 §14 and BCGP §6.5.1 (T0/isogeny-divisor). The Siegel identity D_i + D_{2g+1−i} = V(p^n) stays with HigherHidaAndColemanTheory.
- **Pilloni 2020 route 8:** Ha(G), LF, quasi-polarisations, LF∘λ* and the BT₁ Hodge–Tate sequence: requested from R07.2 (RT-AREA-padic-1/26). Degree items: T0 degree nodes; Hodge–Tate isomorphism for multiplicative H_n: T0/multiplicative-hodge-tate-isomorphism; Lemma 6.3.4.1: imported from R07.2, with boundary application T0/normalized-multiplicative-pullback; HT over the toroidal boundary: T0/hodge-tate-boundary-extension; deg L⁰ = 1/(p+1): acceptance of T0/fargues-degree (computed from Fargues 2010 §6); ω^mod, ω^{mod,+}, 𝔛(p^n)^{⋆−mod}: T5/modified-hodge-bundle, T5/modified-plus-sheaf, T5/modified-minimal-model; the inverse different (§14.9): T0/degree-different (trace codifferent δ_G^{-1}; not the conormal quotient).
- **BCGP 2021 route 13 (items 144, 251, 253):** 144: T0/fargues-degree and T0/isogeny-divisor (with the corrected degree Σ v(x_i), sourceIssues); 251: T0/hodge-tate-boundary-extension and T5/modified-hodge-bundle; 253: T5/modified-minimal-model.
- **Scholze 2015 route 2:** Items 28, 29: T3/subgroup-lifting, T3/section-rigidity; 30, 57: T0/semi-abelian-hasse-invariant, T0/hasse-invariant-ordinary-locus, T0/hasse-invariant-minimal-compactification; 31–35: T3/canonical-subgroup, T3/canonical-subgroup-theorem, T3/canonical-subgroup-properties, T3/quotient-hasse-radius; 39–41: canonical Frobenius lifts and the anticanonical open immersions are PerfectoidShimuraVarieties S1's nodes (T4/canonical-anticanonical-loci and T4/atkin-lehner-anticanonical give the general loci and radius bookkeeping they use); 56: T0/raynaud-hodge-tate-filtration; 59: T2/hodge-tate-flag-point (on points); 61: PerfectoidShimuraVarieties S1/rational-flags-preimage.
- **Caraiani–Scholze 2017 route 6 (items 52, 53, 143):** Not planned here: restructure entry for RT-AREA-padic-1/25.
- **BCGP 2025 route 23 (4.4.1 items):** Not planned here: restructure entry for RT-AREA-padic-1/23.
- **Consumer requests (PerfectoidShimuraVarieties, OverconvergentAutomorphicForms O0/O8, ShimuraCompactifications C6):** PSV→T0: T0/semi-abelian-hasse-invariant, hasse-invariant-ordinary-locus, hasse-invariant-minimal-compactification, raynaud-hodge-tate-filtration, fargues-hodge-tate-cokernel. PSV→T2: T2/hodge-tate-flag-point (Plücker coordinates, Lagrangian charts), T2/abelian-hodge-tate-sequence (Lagrangian, Galois-stable for A/K; no K-linear HT splitting), T2/relative-hodge-tate-sequence. PSV→T3: T3/canonical-subgroup, -theorem, -properties, quotient-hasse-radius, section-rigidity. PSV→T4: T4/canonical-anticanonical-loci, atkin-lehner-anticanonical, period-map-inclusions, ramified-period-comparison (the ramified case requested there). PSV→T5: T5/modified-hodge-bundle, modified-minimal-model, igusa-full-level-comparison. O0→T4: T4/hodge-tate-coordinate (left action, cocycle), period-map-inclusions (c_p), atkin-lehner-anticanonical; the partial-Hasse improvements under U_𝔭 are O6's Hecke statements and are not planned here. O0→T5: T5/integral-differential-lattice, integral-lattice-properties, igusa-torsor, aip-torsor, aip-hodge-tate-comparison. O8→T3 (Siegel p > 2g domain comparison of DRW §3.6): not planned in this pass (coverage remaining). C6→T0: T0/semi-abelian-hasse-invariant (split-torus unit, chart compatibility). PSV→T2 additionally imports open-tower-hodge-tate-map and open-tower-levi-pullback, with S3 keeping their perfectoid incarnation and compactified extension (verifier-qualified RT /22).

**Rescope.** RT-AREA-padic-1/22 was qualified by the verifier: the original S3-only ownership fix would create a cycle and omit T2’s stated open-tower target. The revision retained that wrong fix; this review corrects it.

Follow the verifier’s qualification and REV-FIX-RT-AREA-padic-1~2: T2 owns the map on S0’s open limit v-sheaf, including equivariance and Levi/bundle pullback. S3 imports T2/open-tower-hodge-tate-map and T2/open-tower-levi-pullback; it identifies the adic morphism on the perfectoid representative supplied by S2, proves datum functoriality through S2 embeddings and extends the map/properties to the compactifications with the source’s exact hypotheses. Add S0 → T2; add the direct forwarding edges T2 → S5, T2 → TC.1 and T2 → O8 (already transitive). T2 → S3 stays. S3 → T4 would close T4 → S1 → S2 → S3 → T4 and is forbidden. Move the general homogeneous Hodge–Tate flag/Levi-torsor interface needed by T2 to R09.1/B0’s existing flag direction, rather than importing it from the downstream S3 node. PAN-26/HigherHida briefs distinguish the open T2 map from S3’s compactified incarnation. Campaign/data edits belong to the orchestrator.

**Rescope.** RT-AREA-padic-1/26 (confirmed): the Hasse invariant of a BT₁, LF and the BT₁ Hodge–Tate sequence were routed to T0, which is upstream of none of H2, C6, R15.3, IG.2. The general normalized multiplicative determinant pullback is part of the same R07.2 rerouting.

Owners entry above (owner R07.2, which must extend Frobenius/Verschiebung from fields to arbitrary 𝔽_p-schemes; see requests). T0 keeps T0/semi-abelian-hasse-invariant (boundary extension, compatibility with R07.2, split-torus unit) and the Siegel minimal-compactification statements. Add stage edges R07.2 → H2, R07.2 → C6, R07.2 → AlgebraicModularFormsAndSerreWeights:R15.3, R07.2 → IgusaVarietiesAndTorsionConcentration:IG.2. R07.2 also owns PIL20 Lemma 6.3.4.1. T0/normalized-multiplicative-pullback keeps only its boundary application; no second general theory is planned.

**Rescope.** RT-AREA-padic-1/25 (confirmed): Caraiani–Scholze items 52, 53, 143 (Scholze–Weinstein Theorem 4.1.4 over O_C/p, Theorem B/5.2.1 over O_C, the modification at ∞) were routed to T2, downstream of the whole global Shimura construction; no T2 target needs them.

Create a FiniteFlatGroupsAndIntegralPadicHodgeTheory stage after R07.2 for the Scholze–Weinstein O_C/O_C-p classification and Fargues–Fontaine modification, importing VectorBundlesAndIsocrystals VB1/VB2. Its downstream realization/modification consumers are IG.3 and ET.6a; no T0/T2 target here imports that classification. T0’s character map is a separate input to any future classification proof, never a backedge from classification to T0. Do not import T0’s Hodge–Tate map back into this foundation: that would reverse its prerequisite direction. The classification and modification are not planned here.

**Rescope.** RT-AREA-padic-1/23 (confirmed): BCGP-25 items 4.4.1-usual/-cusp/-analytic-usual/-analytic-cusp were routed to T4, T5, T6, which plan none of them.

Repoint BCGP-25 route 23 in place for 4.4.1-usual/-cusp to TorsionCohomologyInfrastructure TC.2; move the analytic items to HigherHidaAndColemanTheory’s corresponding comparison scope (route 22). Do not leave an empty route. This packet plans none of those completed-cohomology comparisons.

**Rescope.** Stage dependency lines do not list what the plan uses: T0 uses ShimuraCompactifications C5 (toroidal/minimal models, Koecher) and NeronModelsAndSemistableAbelianVarieties R11.3; T2 uses ShimuraData D3 (compact dual) and PELModuli M0; T3 uses T0's Hasse invariant for Siegel data; T4 uses PELModuli M1 and T2's flag point; T5 uses PerfectoidShimuraVarieties S0 (the infinite-level tower) and PerfectoidSpaces P9. T1's dependency text cites 'ClassicalAdicEtaleCohomology C0', which does not exist (RT-AREA-padic-1/32).

Add the stage edges C5 → T0, R11.3 → T0 (already from RS-32), D3 → T2, PELModuli:M0 → T2, T0 → T3, PELModuli:M1 → T4, T2 → T4, PerfectoidShimuraVarieties:S0 → T2 and → T5, P9 → T2 and → T5 (already from RS-05); correct T1's dependency text to ClassicalAdicEtaleCohomology H0. None of these creates a cycle (checked against the recorded stage edges).

**Split.** T0 contains two coherent groups: finite-level Hodge–Tate theory and Fargues's degree of finite flat group schemes over a valuation ring (local, no Shimura varieties), and the semi-abelian/boundary extension (Hasse invariant of semi-abelian schemes, minimal compactification, toroidal extension of HT), which needs ShimuraCompactifications C4/C5.

Propose T0:local containing conormal-module, finite-hodge-tate-map, hodge-tate-map-compatibilities, p-divisible-hodge-tate-map, fargues-hodge-tate-cokernel, fargues-degree, fargues-degree-properties, fargues-degree-generic-isomorphism, fargues-divisor, multiplicative-hodge-tate-isomorphism, harder-narasimhan-filtration, degree-different, conormal-base-change, conormal-right-exact, finite-hodge-tate-naturality, and T0:boundary containing normalized-multiplicative-pullback, isogeny-divisor, semi-abelian-torsion, semi-abelian-hasse-invariant, hasse-invariant-ordinary-locus, hasse-invariant-minimal-compactification, hodge-tate-boundary-extension and raynaud-hodge-tate-filtration. This assigns every T0 node, including HN and degree-different. Only the boundary application imports C4/C5/R11.3; retain current stage IDs pending maintainer acceptance.

**Rescope.** Generic filtered-Tannakian reconstruction is shared by Hodge-type torsors and automorphic bundles.

Extend the existing ReductiveGroups direction as Part II with strict filtered fiber functors, Ziegler’s fpqc splitting, unipotent splitting torsor and reductive parabolic/Levi stabilizer. T2 owns only the rational Hodge–Tate application with its CS17 pro-étale frame argument.

## Suggested signatures and validation

The suggested file contains actual declarations for all 66 node names, 136 API names and 83 test names, with named mathematical tests accompanied by examples. Its carriers are schemes, group objects over schemes, module sheaves/submodules, affine cotangent/Cartier objects, character-lattice tensors, quotient Grassmannians, subgroup objects, ideals, matrices and fractional ideals. Supplier associations and hypotheses omitted from Lean are identified in comments and fully specified above. Those signatures remain schematic until the exact supplier interfaces exist; no unspecified proposition fields stand in for geometry.

The mandatory full-file `lean-check` attempt stops at the missing pinned Tau Ceti cotangent `.olean`. This review cannot claim full elaboration or a Mathlib-only projection result. It created no Lean file outside the suggested deliverable and built or updated no library.

The blueprint checker reports zero errors and zero warnings. The packet review accepts all 66 nodes as a complete target-level plan, with 13 explicit gaps and 18 supplier requests; all six stages are planned and none is closed. Every implementation remains unchecked. The preceding independent review is preserved in `reviewHistory`, and each prior source-issue assessment is retained in its history.
