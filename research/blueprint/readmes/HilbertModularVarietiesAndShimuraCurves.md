# Hilbert modular varieties and Shimura curves

This roadmap constructs the finite-level Hilbert modular varieties and quaternionic
Shimura curves used by the atlas. The Hilbert strand works over every totally real
number field, retains nonprincipal polarization ideals, and treats integral models
at ramified primes and at 2. The quaternionic strand supplies canonical compact
curves, their auxiliary PEL bridge, integral models, coefficient systems and
Čerednik–Drinfeld uniformisation. Definite quaternionic forms supply the integral
Taylor–Wiles modules and dyadic twists needed downstream. Paired torsion twists
supply the actual geometric and local inputs to potential modularity.

The declaration plan contains 133 nodes, 206 API items, 157 tests and 59 planets.
The two [part packets](../packets/HilbertModularVarietiesAndShimuraCurves--H0.json)
([quaternionic continuation](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json))
are the machine-readable dependency contracts. Twelve mathematical layers are
planned; R18.6 is an export index with no additional mathematical declarations.
No layer is certified closed, and every node has implementation status unchecked.
The closure ledger records the missing proofs and supplier interfaces. The
[suggested Lean file](../suggested/HilbertModularVarietiesAndShimuraCurves.lean)
prototypes the available algebraic carriers and lists the contracts that cannot
currently be typed. Elaborating these prototypes does not formalise the roadmap.

## Boundaries and suppliers

The accepted [RS-23 ownership plan](../restructure/RS-23.result.json) assigns the
rational Hilbert data, domains, reflex fields and symplectic embedding to
ShimuraData D5. H0 computes the integral trace-lattice refinements and derived and
central comparisons of those imported objects. PELModuli M0–M3 supplies the
generic datum, fibrewise moduli, representability and complex comparison. H1 and
R18.1 instantiate this engine; H2 proves the Hilbert bad-prime specialization.
A good-prime PEL theorem does not supply that all-prime result. PELModuli M4 owns
general normalization and higher-level integral-cover machinery, used with its
actual hypotheses. Relative abelian schemes, duals, Serre tensor and deformation
theory are imported from AbelianSchemesAndArithmeticModuli A1–A5.

FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 owns the intrinsic BT₁ Hasse
invariant, Fargues LF and intrinsic BT₁ Hodge–Tate map. H2 forms the Hilbert Hasse
ideal and its formal domains from that invariant. HodgeTateAndCanonicalSubgroups
T0 owns the downstream boundary extension. ShimuraCompactifications supplies
minimal and toroidal boundary geometry; R18's compact division curves have no
boundary. PerfectoidShimuraVarieties S5 constructs perfectoid limits, while
OverconvergentAutomorphicForms O4 constructs overconvergent forms. Their use of
the finite connected-unit limit must retain the stable-image correction below.

AutomorphicFormsOnReductiveGroups AF.5 owns the generic algebraic automorphic
function space, coefficients and Hecke operations. R18.3 specializes it to a
definite quaternion algebra and proves geometric auxiliary-level control, finite
isotropy corrections and norm twists. GL2AutomorphicRepresentationsAndTransfer
R17.3 supplies global Jacquet–Langlands. ArithmeticLocallySymmetricSpaces and
ClassicalAdicEtaleCohomology supply coefficient complexes, comparison and duality;
WeightsInEtaleCohomology supplies the purity theorem after the requested
higher-dimensional PEL extension. R18.4 retains all integral torsion and residual
vanishing hypotheses. AutomorphicGaloisRepresentations R19.2 constructs the Galois
representations and local–global compatibility. GL2ModularityLifting R22 chooses
auxiliary primes and patches the geometric modules supplied here; indefinite
integral Ihara is an explicit unclosed obligation, not an upstream patching import.

R18.5 constructs the arithmetic Drinfeld quotient using the general local building,
formal-space and finite-flat-group suppliers. Upstream StableReduction provides
nodes, dual graphs and minimal regular models, and NeronModelsAndSemistableAbelianVarieties
R11 supplies Jacobian monodromy. These general theories are reused rather than
planned again. H6 constructs the paired torsion moduli and local-open targets;
PotentialModularityAndCompatibleSystems R23 proves Moret–Bailly and potential
modularity from these inputs. Gross–Zagier heights, Heegner classes and completed
cohomology are downstream consumers, with their own arithmetic arguments.

## Conventions

Write F for a totally real number field, g=[F:ℚ], O_F for its ring of integers and
𝔡 for its absolute different. In H0–H6, O means O_F. The trace-dual ideal is
𝔇⁻¹=FractionalIdeal.dual ℤ ℚ (1)=𝔡⁻¹; the letter D denotes this ideal only in
those Hilbert contracts. In R18.3, D is the definite quaternion algebra and O is
the coefficient ring. Neither is the Hilbert trace-dual ideal or O_F. In R18.1,
R18.2, R18.4 and R18.5, B/F is the quaternion algebra split at the specified real
embedding τ; the compact case assumes B is division. Quaternionic orders are O_B.

The rational Hilbert groups are

\[
G=\operatorname{Res}_{F/\mathbf Q}\mathrm{GL}_2,\qquad
G^*=G\times_{\operatorname{Res}_{F/\mathbf Q}\mathbf G_m}\mathbf G_m,
\]

where the second determinant map is scalar inclusion. The star denotes the
scalar-determinant group. D5's homological convention fixes h and the trace-form
sign together. Lattices use row vectors. The full G domain is (H^±)^Σ, with
independent signs; the G* domain has the two common-sign components. A chosen
positive connected component is H^Σ. For an ordered invertible fractional ideal c,

\[
L_c=O_F\oplus c^{-1}\mathfrak d^{-1},\qquad
L_c^\#=c\oplus\mathfrak d^{-1}=cL_c,
\quad \psi_{c,a}(x,y)=\operatorname{Tr}_{F/\mathbf Q}
   (a(x_1y_2-x_2y_1)),\quad a\in c.
\]

The integral trace forms are ℤ-valued. Their balance law is
ψ_{c,ba}(x,y)=ψ_{c,a}(bx,y)=ψ_{c,a}(x,by); it is not multiplication of an
integer-valued form by an arbitrary O_F scalar. An ordered c need not be
principal, and choosing a positive element does not choose a canonical generator.

The BHW Hilbert tame convention has N≥4, an O_F-linear μ_N marking on A, and full
p-level frames on A∨, with p∤N. There is no global exclusion of p=2 or p ramified
in F. Full constant torsion frames belong to the characteristic-zero generic
fibre; integral Γ₀ levels use finite locally free subgroup schemes. Allen's
elliptic Y_i instead uses its two full odd torsion frames for fine rigidification:
no extra μ_N marking is part of that elliptic moduli problem. Dualizing its
second residual module is essential to the pairing and determinant convention.

Put U=O_F×, U⁺=NumberField.totallyPositiveIntegerUnits F and
U_M={η∈U:η≡1 mod M O_F}. The square image S_M={η²:η∈U_M} imposes congruence
on the square root. The distinct finite groups are

\[
\Delta(N)=U^+/U_N^2,\qquad
\Delta_n(N)=(U_{p^n}\cap U^+)/U_{p^nN}^2,\qquad
\mathcal U_n=(O_F/p^nO_F)^\times/\operatorname{image}(U^+).
\]

Connected Δ_n, whole-space Δ(p^nN), residue groups and finite scalar-level kernels
have different roles. In the H4 level-group contracts, S_n instead denotes the
specified scalar residue subgroup; its subscript and ambient group distinguish
it from the congruence-square image S_M. The finite connected inverse limit is
identified eventually with its stable images in Δ_n. At p=2 it need not project
onto the whole finite Δ_n.

For quaternionic local comparisons let v|p. In R18.2, K denotes the completion
of F_v's maximal unramified extension. In the local Drinfeld contracts of R18.5,
K is a finite extension of ℚ_p, Ǩ its completed maximal unramified extension,
π a uniformizer and q the residue cardinality; specialize K=F_v for the global
uniformisation. E is the auxiliary CM field in the PEL bridge; any source-local
use of E for a reflex or totally real field is specified in its node. The exact
B× curve has reflex field τ(F); the auxiliary bridge may have a larger weighted
CM reflex field F′. A geometric connected comparison over a common algebraic
closure does not establish its descent over the local K.

Strict formal O_K-modules use relative height and Lie rank. Absolute p-height
scales by [K:ℚ_p]. At ramified primes a raw τ-quotient of a crystal need not be
exact; saturated relative filtrations are explicit proof obligations. Maximal
local level gives an integral formal uniformisation; all p-levels require the
separate rigid tower theorem and p-level Rapoport–Zink input. Arithmetic split
Hecke polynomials are X²−T_vX+q_vS_v, with the stated central character on S_v.
Purity uses geometric Frobenius; residual polynomial contracts use arithmetic
Frobenius and retain the corresponding determinant normalization.

## Sources and layer overview

Birkbeck–Heuer–Williams supplies the Hilbert finite-level and unit-group
conventions; Deligne–Pappas supplies the ramified local model. Andreatta–Iovita–Pilloni
supplies ordinary/Rapoport and Hasse-neighborhood comparisons. Hida is used under
its stated unramified hypotheses. Taylor and Allen et al. supply paired torsion
twists and local constructions. Carayol and Yuan–Zhang supply the quaternionic
PEL bridge, models and integral comparisons. Khare–Wintenberger II supplies
finite isotropy, Taylor–Wiles freeness and dyadic twists. Boutot–Carayol and
Boutot–Zink supply uniformisation; Colmez–Dospinescu–Nizioł supplies the local
analytic tower. The bibliography fixes the actual versions and passages below;
node citations distinguish a source theorem from a specialization or proof pattern.

<a id="h0-bhw23"></a>

**H0/BHW23 — [Overconvergent Hilbert modular forms via perfectoid modular varieties](https://www.numdam.org/item/10.5802/aif.3560.pdf)**. Christopher Birkbeck, Ben Heuer and Chris Williams. Annales de l’Institut Fourier 73 (2023), 1709–1794; published PDF.

Passages: §§5.1–5.2, pp.1740–1747; §§8.1–8.4, pp.1765–1779; §8.5 and §9.1–9.2: consumer conventions only.

Version fingerprint: `d59b7f701eb5258c351d959be08d49f17946245ed1e5779317d2371981c2c5c4`.

<a id="h0-dp94"></a>

**H0/DP94 — [Singularités des espaces de modules de Hilbert, en les caractéristiques divisant le discriminant](https://www.numdam.org/item/CM_1994__90_1_59_0.pdf)**. Pierre Deligne and Georg Pappas. Compositio Mathematica 90 (1994), 59–79.

Passages: §§1–2, pp.59–67; §§3–4, pp.67–73; §5.1–5.12, pp.73–78: comparison context.

Version fingerprint: `bc795da7fcc57b4b5fd2257bc22fc2187c98bf70eaeb1f7efddc92f4af58c2d5`.

<a id="h0-aip16"></a>

**H0/AIP16 — [The adic, cuspidal, Hilbert eigenvarieties](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf)**. Fabrizio Andreatta, Adrian Iovita and Vincent Pilloni. Author version dated 16 May 2016.

Passages: §§3.1–3.2; §5.2.4: ordinary locus lies in the Rapoport locus.

Version fingerprint: `34f517fd8d02d778f16f19745f4303b3955d48646d0ce6665b88a10f6fcdebbd`.

<a id="h0-hida05"></a>

**H0/HIDA05 — [p-adic automorphic forms on reductive groups](https://numdam.org/item/AST_2005__298__147_0.pdf)**. Haruzo Hida. Astérisque 298 (2005), 147–254; public lectures.

Passages: §9.1, pp.230–234: polarized Hilbert moduli and ordinary comparison; its unramified hypotheses retained.

Version fingerprint: `d00381ab75b7039bf37495326abb9c11f4b21fc2ab04ed63cad985d848ecf9f5`.

<a id="h0-taylor02"></a>

**H0/TAYLOR02 — [Remarks on a conjecture of Fontaine and Mazur](https://virtualmath1.stanford.edu/~rltaylor/fm.pdf)**. Richard Taylor. Journal of the Institute of Mathematics of Jussieu 1 (2002), 1–19; author PDF.

Passages: §1, pp.9–13: ordered modules, Lemmas1.2–1.4, simultaneous torsion moduli.

Version fingerprint: `e00ebd580b4bdb591345c051c6ae85801663b4a5807a12269c909a47eff3a57d`.

<a id="h0-allen23"></a>

**H0/ALLEN23 — [Potential automorphy over CM fields](https://math.uchicago.edu/~fcale/papers/Ramanujan.pdf)**. Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne. Annals of Mathematics 197 (2023), 897–1113; published PDF, collated with accepted author copy.

Passages: §7.2.1, Lemma7.2.2 (author pp.203–204); §7.2.5, Assumption7.2.6 and proof of Theorem7.1.11, published pp.1103–1106 (author pp.209–211).

Version fingerprint: `c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02`.

<a id="h0-yz18"></a>

**H0/YZ18 — [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf)**. Xinyi Yuan and Shou-Wu Zhang. Annals of Mathematics 187 (2018), 533–638; published PDF.

Passages: §3.1, pp.550–552: PEL bridge groups and reflex field; §4.1, pp.561–564: quaternionic curve, stabilizers, Propositions4.1–4.4; §5.1, pp.571–573: torus bridge and tower comparison; Collated with author version of17August2017, §§3.1,4.1,5.1; height/integral results outside this part.

Version fingerprint: `29dfd5f19dec401116f1eaf0305305acf5f2fc68aa3c90d4eb6e5222de50d507`.

<a id="h0-roadmap"></a>

**H0/ROADMAP — [Hilbert Modular Varieties And Shimura Curves: source targets](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/HilbertModularVarietiesAndShimuraCurves/README.md)**. Tau Ceti Atlas maintainers. Campaign document and accepted RS-23, read2026-10-07.

Passages: H0–H6 and R18.1; Accepted RS-23 keeps for these eight stages.

<a id="r18-2-carayol"></a>

**R18.2/carayol — [Sur la mauvaise réduction des courbes de Shimura](https://www.numdam.org/item/CM_1986__59_2_151_0.pdf)**. Henri Carayol. Compositio Mathematica 59 (1986), 151–230; published scan.

Passages: §0, pp.151–154; §§1.4 and 2.2 (coefficients/PEL); §§4.1–4.5, pp.181–189; §§5.1–5.6, pp.189–194; §§6.1–6.7, pp.194–197; §7 introduction and §7.2, pp.197–198; §9.2–9.5, pp.207–210.

Version fingerprint: `22c01e577504a9963168e78373286d8ecac6ecc8178db64262cf8d473b91b3b3`.

<a id="r18-2-yz"></a>

**R18.2/yz — [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf)**. Xinyi Yuan and Shou-Wu Zhang. Annals of Mathematics 187 (2018), 533–638; version of record.

Passages: §§3–5, pp.550–577; §8.3 superspecial uniformisation, pp.619–621; reviewed source corrections checked against these passages.

Version fingerprint: `29dfd5f19dec401116f1eaf0305305acf5f2fc68aa3c90d4eb6e5222de50d507`.

<a id="r18-2-yz-erratum"></a>

**R18.2/yz-erratum — [Erratum to On the Averaged Colmez Conjecture](https://web.math.princeton.edu/~shouwu/publications/Erratum5.pdf)**. Xinyi Yuan and Shou-Wu Zhang. Author revision 18 December 2022; final journal erratum Annals 198 (2023), 867–878 not collated.

Passages: §1, Theorems 1–2, verification of graph-of-different-torsion kernel.

Version fingerprint: `18b46acd0f6be352d4bc5b4d7797650be3e228712e13de94bbb45ec25b576c91`.

<a id="r18-2-bc"></a>

**R18.2/bc — [Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf)**. Jean-François Boutot and Henri Carayol. Astérisque 196–197 (1991), article pp.45–158; full-volume PDF.

Passages: Introduction, pp.45–48; Part I §§1–3, pp.49–56 (tree, norms, charts); Part II §§5.12–5.17, pp.96–98; §§7.4–7.6 and 8.1–8.4, pp.105–109; §9.3, pp.110–111; Part III §§5.1–5.4, pp.139–146; OCR-defective formulas checked on page images.

Version fingerprint: `2a9aa0b0a046cb37e4d6b6ccc06dfaa00f10d90223ac9d2cb94918d069295119`.

<a id="r18-2-bz"></a>

**R18.2/bz — [On the p-adic uniformization of quaternionic Shimura curves](https://arxiv.org/pdf/2212.06886v1)**. Jean-François Boutot and Thomas Zink. arXiv:2212.06886v1, 13 December 2022 (text dated 15 December).

Passages: §1, pp.1–3; §5.7–5.11, pp.37–40; §6.2–6.3, pp.42–45; §6.6–6.8, pp.46–50; (6.29)–(6.31) local level convention.

Version fingerprint: `89efb1ef16c2f7704d7f375f7aca4a2a5bcf81053211035b8c09d037545060dd`.

<a id="r18-2-kw"></a>

**R18.2/kw — [Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf)**. Chandrashekhar Khare and Jean-Pierre Wintenberger. Author copy proofs.pdf, 98 pages, dated 30 May 2009; published Inventiones 178 (2009), 505–586.

Passages: §7 (opening, pp.57–60) and §§7.1–7.5, pp.60–67; references to auxiliary neatness in §§8.2,8.4, pp.73,77.

Version fingerprint: `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4`.

<a id="r18-2-taylor"></a>

**R18.2/taylor — [On the Meromorphic Continuation of Degree Two L-Functions](https://ems.press/content/book-chapter-files/27484?nt=1)**. Richard Taylor. Documenta Mathematica Extra Volume Coates (2006), 729–779; revised 28 June 2006.

Passages: §1, pp.737–742, Lemma 1.1, Corollary 1.2, integral pairings; §2 Lemmas 2.2–2.4.

Version fingerprint: `6ec26bfc12e1cf38d410b36c18f985e2fb26c1cb1bb03d6e5197ccf58f92c51c`.

<a id="r18-2-cdn20"></a>

**R18.2/cdn20 — [Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2)**. Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł. arXiv:1704.08928v2, 7 June 2018; source for JAMS 33 (2020), 311–362.

Passages: §1.2, pp.12–13; §5.2.1–5.2.2, pp.41–43, Proposition 5.4.

Version fingerprint: `15e4868f5b11ad113e2806b5e9884d7b100f529e67c6cd6030f24cf8e3ae9073`.

<a id="r18-2-cdn23"></a>

**R18.2/cdn23 — [Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://arxiv.org/pdf/2204.11214)**. Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł. arXiv:2204.11214v2; source for Forum of Mathematics Pi 11 (2023), e16.

Passages: §4.1.1–4.1.3, pp.47–49, residual Hecke ideal.

Version fingerprint: `c5711666b845a48f6fc2cd944b22bbde0c45567fe29dacb00a3429619baecbee`.

| Layer | Purpose | Nodes | Coverage |
| --- | --- | ---: | --- |
| [H0](#h0) | The two data and their domains | 6 | planned |
| [H1](#h1) | Polarization modules and Hilbert–Blumenthal moduli | 10 | planned |
| [H2](#h2) | Integral models at arbitrary p | 9 | planned |
| [H3](#h3) | Arithmetic quotient and unit actions | 8 | planned |
| [H4](#h4) | Finite p-level structures and effective groups | 19 | planned |
| [H5](#h5) | Classical geometry and comparison tests | 5 | planned |
| [H6](#h6) | Twisted torsion moduli and arithmetic points | 9 | planned |
| [R18.1](#r18.1) | Hilbert–Blumenthal and quaternionic moduli | 9 | planned |
| [R18.2](#r18.2) | Compactification and integral models | 18 | planned |
| [R18.3](#r18.3) | Definite quaternionic forms | 19 | planned |
| [R18.4](#r18.4) | Cohomology and Hecke correspondences | 9 | planned |
| [R18.5](#r18.5) | Bad-prime uniformisation | 12 | planned |
| [R18.6](#r18.6) | The geometric outputs used by modularity | 0 | source decomposed |

The presentation follows H0–H6 and R18.1–R18.6. Declaration prerequisites give the
build order: the auxiliary PEL and split-place nodes of R18.2 precede R18.5, which
in turn supplies the division-place integral nodes of R18.2. Localized TW control
in R18.3 uses R19.2 after the early R18.4 cohomology. The layer splits collected
in the handoff remove these coarse-layer cycles; the assembled declaration graph
is acyclic. Stage numbering remains the stable atlas interface.

## Pinned baseline

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit leaves the
advanced moduli and comparison targets unbuilt. Existing declarations are reused
with their actual ambient types: a scheme carrier does not supply relative
abelian-scheme moduli, and a fundamental-groupoid coefficient functor does not
supply integral étale H¹. The following 31 distinct baseline declarations are
the entry points of the two parts.

- **`mathlib:Algebra.trace`** (def; `Mathlib/RingTheory/Trace/Defs.lean`): The trace linear map of a finite algebra; here Tr_{F/ℚ}.
- **`mathlib:Submodule.mem_traceDual`** (lemma; `Mathlib/RingTheory/DedekindDomain/Different.lean`): Membership in traceDual A K I iff every trace-form pairing with I lies in the image of A→K.
- **`mathlib:FractionalIdeal.dual`** (def; `Mathlib/RingTheory/DedekindDomain/Different.lean`): Trace dual fractional ideal; sends zero to zero and nonzero I to the trace-dual submodule.
- **`mathlib:FractionalIdeal.dual_eq_mul_inv`** (lemma; `Mathlib/RingTheory/DedekindDomain/Different.lean`): For the separable integral-closure Dedekind setting, dual A K I=dual A K 1*I⁻¹.
- **`mathlib:FractionalIdeal.dual_dual`** (lemma; `Mathlib/RingTheory/DedekindDomain/Different.lean`): Trace dual is involutive in the separable integral-closure Dedekind setting.
- **`mathlib:Matrix.adjugate_mul_distrib`** (theorem; `Mathlib/LinearAlgebra/Matrix/Adjugate.lean`): Over a commutative ring, adjugate(M*N)=adjugate N*adjugate M, with reversed order.
- **`mathlib:Matrix.det_adjugate`** (theorem; `Mathlib/LinearAlgebra/Matrix/Adjugate.lean`): For a finite matrix of cardinality k, det(adjugate M)=det(M)^(k−1); in dimension2 it equals det M.
- **`mathlib:QuotientGroup.mk'`** (def; `Mathlib/GroupTheory/QuotientGroup/Defs.lean`): The quotient homomorphism G→G/N for a normal subgroup, on the native quotient-group carrier.
- **`tauceti:NumberField.IsTotallyPositive`** (def; `TauCeti/NumberTheory/NumberField/TotallyPositive.lean`): Strict positivity under each real infinite-place embedding.
- **`tauceti:NumberField.totallyPositiveIntegerUnits`** (def; `TauCeti/NumberTheory/NumberField/TotallyPositive.lean`): The preimage subgroup of positive field units in the arithmetic unit group (𝒪_F)×.
- **`tauceti:NumberField.sq_mem_totallyPositiveIntegerUnits`** (theorem; `TauCeti/NumberTheory/NumberField/TotallyPositive.lean`): Every arithmetic unit square belongs to totallyPositiveIntegerUnits.
- **`tauceti:NumberField.units_sq_index_eq`** (theorem; `TauCeti/NumberTheory/NumberField/Units/ElementaryTwoQuotient.lean`): Index of the square subgroup of arithmetic units equals 2^(NumberField.Units.rank F+1).
- **`tauceti:NumberField.unitsMulEquivTorsionProdMultiplicative`** (def; `TauCeti/NumberTheory/NumberField/Units/Dirichlet.lean`): Multiplicative equivalence from arithmetic units to torsion(F)×Multiplicative(Fin(rank F)→ℤ).
- **`tauceti:NumberField.NarrowClassGroup.instFinite`** (instance; `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Finite.lean`): The narrow ideal class group of a number field is finite.
- **`tauceti:NumberField.NarrowClassGroup.exists_mk0_eq_and_isCoprime_absNorm`** (theorem; `TauCeti/NumberTheory/NumberField/NarrowClassGroup/CoprimeRepresentative.lean`): For a narrow class C and nonzero m∈ℤ, an integral ideal J represents C and has absolute norm coprime to m.
- **`mathlib:AlgebraicGeometry.Scheme`** (structure; `Mathlib/AlgebraicGeometry/Scheme.lean`): The existing locally affine locally ringed space carrier; not a fresh Hilbert-specific definition of scheme.
- **`mathlib:DoubleCoset.Quotient`** (def; `Mathlib/GroupTheory/DoubleCoset.lean`): Existing double-coset quotient; specialized, never reconstructed.
- **`mathlib:DoubleCoset.eq`** (lemma; `Mathlib/GroupTheory/DoubleCoset.lean`): Equality is witnessed by left and right subgroup multiplication.
- **`mathlib:Representation`** (abbrev; `Mathlib/RepresentationTheory/Basic.lean`): Monoid homomorphism into linear endomorphisms.
- **`mathlib:Submodule`** (structure; `Mathlib/Algebra/Module/Submodule/Defs.lean`): Linear subobjects, including invariant coefficient submodules.
- **`mathlib:MonoidAlgebra`** (structure; `Mathlib/Algebra/MonoidAlgebra/Defs.lean`): Group-algebra substrate for diamond actions.
- **`mathlib:QuotientGroup.mk`** (abbrev; `Mathlib/GroupTheory/Coset/Defs.lean`): Quotient by a subgroup; group structure requires normality.
- **`mathlib:AlgebraicGeometry.Flat`** (class; `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean`): Flat scheme morphisms; affine/stalk conditions.
- **`mathlib:IsRegularLocalRing`** (class; `Mathlib/RingTheory/RegularLocalRing/Defs.lean`): Noetherian local regularity via maximal ideal and Krull dimension.
- **`mathlib:Module.Free`** (class; `Mathlib/LinearAlgebra/FreeModule/Basic.lean`): Freeness via existence of a basis, not just finiteness.
- **`mathlib:Module.Finite`** (class; `Mathlib/RingTheory/Finiteness/Defs.lean`): Finite generation over a specified scalar ring.
- **`tauceti:TauCeti.LocalCoefficientSystem`** (abbrev; `TauCeti/AlgebraicTopology/LocalCoefficient.lean`): Fundamental-groupoid functor to modules, not a cohomology theorem.
- **`mathlib:MvPolynomial.eval₂Hom`** (def; `Mathlib/Algebra/MvPolynomial/Eval.lean`): Evaluation in a commutative target via a coefficient ring map and values of variables.
- **`mathlib:RingHom.ker`** (def; `Mathlib/RingTheory/Ideal/Maps.lean`): Ideal kernel of the residual polynomial evaluation.
- **`mathlib:RingHom.ker_isMaximal_of_surjective`** (theorem; `Mathlib/RingTheory/Ideal/Maps.lean`): Surjective homomorphism to a division ring has maximal ideal kernel.
- **`mathlib:LinearEquiv`** (structure; `Mathlib/Algebra/Module/Equiv/Defs.lean`): Invertible linear map on actual coefficient-function spaces.

## Declaration plan

Each node gives its exact statement, hypotheses, proof route and dependencies.
Definitions and constructions carry the API and discriminating unit tests chosen
from their uses. Planet names describe the mathematical object or theorem; they
do not certify implementation. A target with a named closure gap remains conditional
on resolving that gap. Module paths are intended library locations, not existing files.

<a id="h0"></a>

## H0. The two data and their domains

Reuse D5’s rational data. Compute their derived groups and full algebraic centres, then refine the trace representation by the actual ordered lattice. The centre of G* can be disconnected; its identity component alone is not the centre. The abelian-type comparison uses the derived group, while the Hodge-type assertion uses the actual G* trace embedding.

<a id="h0-derived-centres"></a>

### Derived groups and algebraic centres

`HilbertModularVarietiesAndShimuraCurves:H0/derived-centres` · theorem · `TauCeti.HilbertModular.derived_centres`

On D5’s groups G and G*, both derived groups are Res_{F/ℚ}SL₂ and their inclusion is the identity there. Z(G)=Res_{F/ℚ}G_m. Z(G*) is the subgroup of scalar matrices t I₂ with t² in the diagonal G_m, including its finite geometric components; its identity component is diagonal G_m. Dimensions are 4g and 3g+1. No connectedness of the full centre of G* is assumed.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Base change the imported groups to a splitting field: G becomes ∏GL₂ and G* the common-determinant subgroup.
2. Compute commutators and centralizers factor by factor; preserve the equations t_τ²=t_σ² as scheme equations, not merely real points.
3. Descend the comparisons along the imported restriction-of-scalars and fibre-product maps.

**Prerequisites.** `ShimuraData:D5/hilbert-datum`, `ShimuraData:D5/hilbert-star-datum`.

**Acceptance checks.**

- For F=ℚ both groups and centres coincide.
- For g=2, the centre of G* over an algebraic closure has two components.

**Source contracts.**

- [H0/ROADMAP](#h0-roadmap), H0, first paragraph; RS-23 H0 keeps: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H0`; namespace `TauCeti.HilbertModular`.

**Planet.** Hilbert derived groups.

<a id="h0-domain-comparison"></a>

### Independent signs and common signs

`HilbertModularVarietiesAndShimuraCurves:H0/domain-comparison` · comparison · `TauCeti.HilbertModular.domain_comparison`

The map of D5 data identifies the common-sign G* domain H^Σ ⊔ (H⁻)^Σ with the corresponding two components of the G domain (H^±)^Σ. The latter has 2^g components; both have complex dimension g and reflex field ℚ. The connected positive domains are equal, but the full conjugacy classes differ for g>1.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the imported real group identifications and the signs of the determinants acting on each half-plane.
2. A common determinant forces a common sign; arbitrary G determinants allow independent signs.
3. Compare the imported cocharacter Galois orbits to their already computed reflex fields.

**Prerequisites.** `ShimuraData:D5/hilbert-datum`, `ShimuraData:D5/hilbert-star-datum`, [H0/derived-centres](#h0-derived-centres).

**Acceptance checks.**

- For a real quadratic field the component counts are 4 and 2.
- The mixed upper/lower point does not lie in the G* conjugacy class.

**Source contracts.**

- [H0/ROADMAP](#h0-roadmap), H0, domain comparison: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H0`; namespace `TauCeti.HilbertModular`.

<a id="h0-polarization-lattice"></a>

### Polarization lattice

`HilbertModularVarietiesAndShimuraCurves:H0/polarization-lattice` · definition · `TauCeti.HilbertModular.polarizationLattice`

For a nonzero invertible fractional ideal c of O, let D=Fractional Ideal.dual ℤ ℚ O=d⁻¹ and L_c=O⊕c⁻¹D⊂F², with row-vector convention. This is the integral lattice refining D5’s rational representation. For an integral ideal c, K_c is its finite adelic stabilizer; a column convention uses the transpose-conjugate lattice.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Reuse the pinned fractional ideal and trace-dual carriers; define only this Hilbert lattice.
2. Use invertibility of c and the trace-dual formula to identify the second summand.
3. Fix the row convention before calculating stabilizers.

**Prerequisites.** `mathlib:FractionalIdeal.dual`, `mathlib:FractionalIdeal.dual_eq_mul_inv`, `ShimuraData:D5/hilbert-trace-embedding`.

**API.**

- `TauCeti.HilbertModular.polarizationLattice` (constructor): Construct L_c as the O-submodule O×c⁻¹d⁻¹ of F×F.
- `TauCeti.HilbertModular.mem_polarizationLattice` (characterisation): (x,y)∈L_c iff x∈O and y∈c⁻¹d⁻¹.
- `TauCeti.HilbertModular.polarizationLattice_rank` (structure): L_c is projective of rank 2 over O and free of rank 2g over ℤ.
- `TauCeti.HilbertModular.polarizationLattice_rescale` (functoriality): For a∈F×, diag(1,a⁻¹) carries L_c to L_{ac} in the row convention.

**Unit tests.**

- `TauCeti.HilbertModular.lattice_Q` (computation): For F=ℚ,c=ℤ, L_c=ℤ².
- `TauCeti.HilbertModular.lattice_nonprincipal` (non-example): L_c is defined for a nonprincipal c without choosing a generator.
- `TauCeti.HilbertModular.lattice_different` (compatibility): For c=O the second summand is the pinned trace dual of O, not O unless d is trivial.

**Acceptance checks.**

- Its ℤ-rank is 2g; the zero ideal is excluded.

**Uses.**

- BHW Definition 5.2: Determine the actual adelic level stabilizer.
- H1 trace PEL instance: Retain the polarization module in the integral lattice.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Notation 5.1(3) and Definition 5.2(1), pp.1740–1741: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H0`; namespace `TauCeti.HilbertModular`.

**Planet.** Polarization lattice.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h0-integral-trace-family"></a>

### Integral trace polarization family

`HilbertModularVarietiesAndShimuraCurves:H0/integral-trace-family` · definition · `TauCeti.HilbertModular.integralTraceFamily`

For a∈c and x,y∈L_c set ψ_{c,a}(x,y)=Tr_{F/ℚ}(a(x₁y₂−x₂y₁))∈ℤ. This is a family parametrized O-linearly by c, rather than a canonical principal symplectic form. Nonzero a gives a nondegenerate rational alternating form; totally positive a has the polarization sign prescribed by D5 (negate the form if the positive h(i) convention is used).

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Multiply the wedge in c⁻¹d⁻¹ by a∈c, obtaining d⁻¹.
2. Apply the pinned trace-dual membership criterion to obtain an integer.
3. Restrict the imported rational trace form, recording its sign and parameter.
4. For b∈O move b between the parameter and either lattice argument inside the commutative trace expression. This gives the balancing law and the precise O-module action on the form family.

**Prerequisites.** [H0/polarization-lattice](#h0-polarization-lattice), `mathlib:Submodule.mem_traceDual`, `mathlib:Algebra.trace`, `ShimuraData:D5/hilbert-trace-form`.

**API.**

- `TauCeti.HilbertModular.integralTraceFamily` (constructor): Map c to the alternating ℤ-bilinear forms on L_c by a↦ψ_{c,a}.
- `TauCeti.HilbertModular.integralTraceFamily_apply` (simp): Evaluation is Tr(a(x₁y₂−x₂y₁)).
- `TauCeti.HilbertModular.integralTraceFamily_parameter_add` (functoriality): ψ_{a+b}=ψ_a+ψ_b and ψ_0=0.
- `TauCeti.HilbertModular.integralTraceFamily_integral` (compatibility): Its rational image agrees with D5’s trace representation multiplied by a.
- `TauCeti.HilbertModular.integralTraceFamily_balance` (relation): For b∈O, ψ_{ba}(x,y)=ψ_a(bx,y)=ψ_a(x,by). This specifies the O-action on the family of Z-bilinear forms; it is not scalar multiplication of their Z-valued outputs.

**Unit tests.**

- `TauCeti.HilbertModular.traceFamily_Q` (computation): Over ℚ,c=ℤ,a=1 its value on the two standard basis vectors is 1.
- `TauCeti.HilbertModular.traceFamily_zero` (degenerate): The a=0 form is zero, hence is not declared nondegenerate.
- `TauCeti.HilbertModular.traceFamily_ramified` (non-example): For F=ℚ(√2), the second summand uses d⁻¹=(2√2)⁻¹O, preventing a false O² self-duality assertion.

**Acceptance checks.**

- No generator of c is part of the definition.

**Uses.**

- H1 c-polarization: Encode the whole ordered polarization module.
- H6 real points: Fix the trace polarization sign at every embedding.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Notation 5.1(3), p.1740; compare DP§2.12: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H0`; namespace `TauCeti.HilbertModular`.

**Planet.** Trace polarization.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h0-lattice-duality"></a>

### Trace-dual lattice and its stabilizer

`HilbertModularVarietiesAndShimuraCurves:H0/lattice-duality` · theorem · `TauCeti.HilbertModular.lattice_duality`

For ψ(x,y)=Tr(x₁y₂−x₂y₁), the ℤ-dual lattice of L_c is c⊕d⁻¹=c L_c. Its finite adelic row stabilizer is K_c=GL₂(A_{F,f})∩[[Ô,(cd)⁻¹Ô],[cdÔ,Ô]]. Intersecting with G*(A_f) imposes rational scalar determinant. These are equalities of lattices and groups, including nonprincipal c.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Dualize the two summands using the pinned fractional-ideal trace-dual formula.
2. Use the row action: L_c γ=L_c determines the four entry ideals and invertibility of γ.
3. Apply the calculation locally, then take restricted products.

**Prerequisites.** [H0/polarization-lattice](#h0-polarization-lattice), [H0/integral-trace-family](#h0-integral-trace-family), `mathlib:FractionalIdeal.dual_eq_mul_inv`, `mathlib:FractionalIdeal.dual_dual`.

**Acceptance checks.**

- For c=O the trace lattice is unimodular.
- In a nonprincipal class the equality c L_c=L_c^# does not manufacture a principal polarization.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Notation 5.1(3) and Definition 5.2(1), pp.1740–1741: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H0`; namespace `TauCeti.HilbertModular`.

**Planet.** Trace-dual lattice.

<a id="h0-type-witnesses"></a>

### Hodge and abelian type witnesses

`HilbertModularVarietiesAndShimuraCurves:H0/type-witnesses` · theorem · `TauCeti.HilbertModular.type_witnesses`

D5’s actual trace embedding of (G*,X*) into the Siegel datum, with the sign fixed by integral Trace Family, is a D4 Hodge-type witness. The identity Res SL₂→Res SL₂ on the derived groups induces the common connected adjoint datum, and is a D4 abelian-type witness for (G,X). It does not assert a Hodge-type embedding of the exact group G.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Verify closed immersion and compatibility with h for D5’s map, not just faithfulness of a real representation.
2. Use the common derived group and connected adjoint domains for the central-isogeny condition.
3. Separate the integral lattice refinement from the rational type assertion.

**Prerequisites.** [H0/derived-centres](#h0-derived-centres), [H0/domain-comparison](#h0-domain-comparison), [H0/integral-trace-family](#h0-integral-trace-family), `ShimuraData:D5/hilbert-trace-embedding`, `ShimuraData:D4/hodge-type`, `ShimuraData:D4/abelian-type`.

**Acceptance checks.**

- The witness for G is a derived comparison, with no forced similitude for independent determinants.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Notation 5.1, continuation p.1741: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H0`; namespace `TauCeti.HilbertModular`.

**Planet.** Hilbert type witnesses.

<a id="h1"></a>

## H1. Polarization modules and Hilbert–Blumenthal moduli

A symmetric homomorphism, a positive polarization and an ordered c-polarization are three levels of structure. The DP evaluation isomorphism is essential. Match the μ_N marking and the row stabilizer before applying the PEL complex comparison. The norm characteristic polynomial is stored in full. A local pairing generator changes the multiplier and is never called canonical.

<a id="h1-ordered-polarization-module"></a>

### Ordered polarization module

`HilbertModularVarietiesAndShimuraCurves:H1/ordered-polarization-module` · definition · `TauCeti.HilbertModular.OrderedPolarizationModule`

An ordered invertible O-module is a projective rank-one O-module c with, for each real embedding τ, a chosen component c_τ^+ of (c⊗_{O,τ}ℝ)\{0}. Its positive cone is the set of elements whose images lie in all selected components. Fractional ideals have the standard embedding order, and ordered isomorphisms preserve each component.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Transport the projective rank-one module to a fractional ideal; retain the ordering as part of the object.
2. Define positivity using real scalar extension, agreeing with the pinned totally-positive predicate for the standard O object.

**Prerequisites.** `mathlib:FractionalIdeal.dual`, `tauceti:NumberField.IsTotallyPositive`.

**API.**

- `TauCeti.HilbertModular.OrderedPolarizationModule` (constructor): Package the invertible O-module with the chosen real half-lines.
- `TauCeti.HilbertModular.positiveCone` (data): The intersection of their inverse images in c.
- `TauCeti.HilbertModular.orderedModule_iso` (characterisation): A module isomorphism is ordered iff it sends each selected real half-line to the selected half-line.
- `TauCeti.HilbertModular.standard_positiveCone` (compatibility): For standard c=O, its cone equals {a∈O | Number Field.Is Totally Positive(a:F)}.

**Unit tests.**

- `TauCeti.HilbertModular.ordered_Q` (computation): For O=ℤ the standard cone consists of positive integers.
- `TauCeti.HilbertModular.ordered_negative` (non-example): Multiplication by−1 is not an automorphism of the standard ordered module.
- `TauCeti.HilbertModular.ordered_nonprincipal` (compatibility): An invertible nonprincipal ideal with its embedding cones is admitted without a basis.

**Acceptance checks.**

- An unordered module is not sufficient to specify a polarization cone.

**Uses.**

- Taylor§1, pp.9–13: Define the HBAV polarization and its real signature.
- H3 ideal comparisons: Distinguish ordinary from narrow ideal classes.

**Source contracts.**

- [H0/TAYLOR02](#h0-taylor02), §1, p.9, ordered invertible OM-module: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H1`; namespace `TauCeti.HilbertModular`.

**Planet.** Ordered polarization module.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h1-symmetric-polarizations"></a>

### Symmetric real multiplication polarizations

`HilbertModularVarietiesAndShimuraCurves:H1/symmetric-polarizations` · definition · `TauCeti.HilbertModular.HilbertPolarizationModule`

For an A1 abelian scheme A/S of relative dimension g with unital injective real multiplication ι:O→End_S(A), P(A,ι) is the étale sheaf of O-linear maps f:A→A∨ satisfying f=f∨ under A2 biduality. P(A,ι)^+ is the subsheaf of polarizations, defined by A2 ampleness. On the Hilbert locus the sheaf is an invertible O-module with its embedding-wise order; the evaluation condition is imposed by the separate c-polarization definition.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the imported dual and Hom sheaf to equalize f and f∨ and impose O-linearity.
2. The positive cone comes from ample line bundles via A2; define the DP evaluation condition separately from a single positive homomorphism.
3. Use Serre tensor and étale localization to interpret c as an ordered locally constant sheaf.

**Prerequisites.** [H1/ordered-polarization-module](#h1-ordered-polarization-module), `AbelianSchemesAndArithmeticModuli:A1`, `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A3`.

**API.**

- `TauCeti.HilbertModular.HilbertPolarizationModule` (constructor): The symmetric O-linear Hom sheaf P(A,ι).
- `TauCeti.HilbertModular.hilbertPolarizationModule_positive` (projection): The subsheaf of positive homomorphisms from A2 ampleness.
- `TauCeti.HilbertModular.hilbertPolarizationModule_mem` (characterisation): A section is an O-linear map equal to its bidual transpose.
- `TauCeti.HilbertModular.hilbertPolarizationModule_pullback` (functoriality): Pullback is the A2 Hom/duality base-change map on the stipulated Hilbert locus.
- `TauCeti.HilbertModular.hilbertPolarizationModule_ext` (extensionality): Two sections of P(A,ι) agree if their underlying A→A∨ morphisms agree; the symmetry and O-linearity proofs add no extra section data.

**Unit tests.**

- `TauCeti.HilbertModular.polModule_Q` (compatibility): For a geometric elliptic curve the symmetric Hom group is ℤ, with its degree-positive ray.
- `TauCeti.HilbertModular.polModule_zero` (degenerate): Zero is symmetric and is excluded from the positive cone.
- `TauCeti.HilbertModular.polModule_negative` (non-example): If λ is a polarization, −λ is symmetric but not positive.

**Acceptance checks.**

- Symmetry and positivity are separate conditions.

**Uses.**

- BHW Definition 5.3: Provide the HBAV family on M1 carriers.
- DP2.1 and H2: Define the integral DP moduli condition.

**Source contracts.**

- [H0/DP94](#h0-dp94), §§1.1–1.5 and 2.1, pp.60–63: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H1`; namespace `TauCeti.HilbertModular`.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h1-c-polarization"></a>

### Ordered c-polarization

`HilbertModularVarietiesAndShimuraCurves:H1/c-polarization` · definition · `TauCeti.HilbertModular.CPolarization`

For an ordered invertible O-module c and a real-multiplication abelian scheme A/S, a c-polarization is an ordered isomorphism c_S≅P(A,ι), preserving the positive cones, whose evaluation A⊗_O c→A∨ is an isomorphism. The Serre tensor, duality and positivity are A2/A3 imports. This is the DP condition, including nonprincipal c.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the imported dual and Hom sheaf to equalize f and f∨ and impose O-linearity.
2. The positive cone comes from ample line bundles via A2; define the DP evaluation condition separately from a single positive homomorphism.
3. Use Serre tensor and étale localization to interpret c as an ordered locally constant sheaf.

**Prerequisites.** [H1/symmetric-polarizations](#h1-symmetric-polarizations), [H1/ordered-polarization-module](#h1-ordered-polarization-module), `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`.

**API.**

- `TauCeti.HilbertModular.CPolarization` (constructor): The ordered isomorphism with the DP evaluation condition.
- `TauCeti.HilbertModular.cPolarization_eval` (projection): The induced evaluation isomorphism A⊗_O c≅A∨.
- `TauCeti.HilbertModular.cPolarization_baseChange` (functoriality): Evaluation and positivity commute with arbitrary base change.
- `TauCeti.HilbertModular.cPolarization_rosati` (compatibility): Every positive section gives a polarization whose Rosati involution fixes O.

**Unit tests.**

- `TauCeti.HilbertModular.cPol_elliptic` (compatibility): For F=ℚ,c=ℤ this is the principal elliptic polarization.
- `TauCeti.HilbertModular.cPol_negative` (non-example): The negative symmetric map reverses the cone and is not a c-polarization.
- `TauCeti.HilbertModular.cPol_nonprincipal` (non-example): No global generator of c is required.

**Acceptance checks.**

- Symmetry and positivity are separate conditions.

**Uses.**

- BHW Definition 5.3: Provide the HBAV family on M1 carriers.
- DP2.1 and H2: Define the integral DP moduli condition.

**Source contracts.**

- [H0/DP94](#h0-dp94), §§1.1–1.5 and 2.1, pp.60–63: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H1`; namespace `TauCeti.HilbertModular`.

**Planet.** Hilbert–Blumenthal polarization.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h1-hilbert-pel-instance"></a>

### Hilbert PEL instance

`HilbertModularVarietiesAndShimuraCurves:H1/hilbert-pel-instance` · construction · `TauCeti.HilbertModular.hilbertPELInstance`

For c as in H1, specialize M0/M1 with B=F, *=id, V=F², L=L_c and the c-indexed integral trace polarization family. At primes where a chosen positive a∈c and d give the good PEL lattice hypotheses, this is the usual trace-pairing PEL datum; the homological h and positivity sign agree with H0. At other primes it is a generic-fibre datum with a DP integral extension constructed in H2, not an application of M2 smoothness.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Insert the actual lattice and scalar involution into M0; verify ψ(ax,y)=ψ(x,ay).
2. Use H0 type witnesses and A2 positivity to match M1’s homological convention.
3. List every inverted prime of the chosen good lattice; do not propagate that list to H2.

**Prerequisites.** [H0/type-witnesses](#h0-type-witnesses), [H0/lattice-duality](#h0-lattice-duality), [H1/c-polarization](#h1-c-polarization), `PELModuli:M0/integral-pel-datum`, `PELModuli:M1/pel-abelian-scheme`, `mathlib:AlgebraicGeometry.Scheme`.

**API.**

- `TauCeti.HilbertModular.hilbertPELInstance` (constructor): The specialization map from the ordered c-polarization data to M0/M1.
- `TauCeti.HilbertModular.hilbertPEL_involution` (simp): The adjoint action of every a∈F is the identity involution a↦a.
- `TauCeti.HilbertModular.hilbertPEL_lattice` (data): The integral lattice is L_c and its trace dual is c L_c.
- `TauCeti.HilbertModular.hilbertPEL_moduli_equiv` (equivalence): The specialized M1 objects are exactly H1’s HBAV objects with the listed level and determinant conditions.

**Unit tests.**

- `TauCeti.HilbertModular.pel_Q` (compatibility): For F=ℚ,c=ℤ obtain the genus-one PEL object.
- `TauCeti.HilbertModular.pel_nonprincipal` (non-example): For nonprincipal c the lattice comparison retains c rather than replacing it by O.
- `TauCeti.HilbertModular.pel_ramified` (non-example): A ramified prime failing the perfect-lattice condition cannot be declared smooth by M2.

**Acceptance checks.**

- A good-prime M2 invocation carries its actual perfect-lattice hypothesis.

**Uses.**

- PELModuli M2/M3: Apply general representability and complex comparison to checked inputs.
- H2: Identify the canonical characteristic-zero fibre of the DP model.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Notation 5.1 and Definition 5.3, pp.1740–1741: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H1`; namespace `TauCeti.HilbertModular`.

**Planet.** Hilbert PEL datum.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h1-hilbert-determinant"></a>

### Full Hilbert determinant condition

`HilbertModularVarietiesAndShimuraCurves:H1/hilbert-determinant` · theorem · `TauCeti.HilbertModular.hilbert_determinant`

In characteristic zero, and on the integral Rapoport locus, Lie(A) is rank one over O⊗𝒪_S and for every a∈O its characteristic polynomial is Norm_{F/ℚ}(T−a). This full polynomial is the M0 determinant condition; equality of traces alone is insufficient in ramified characteristic. The all-base DP implication is proved in H2 from flatness of the universal model and pullback, not from equality on geometric points.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the characteristic-zero Hilbert multiplicities and the free rank-one module on the Rapoport locus to compute the regular-representation norm polynomial.
2. Store all characteristic-polynomial coefficients in M0’s determinant interface and its base-change compatibility.
3. For the ramified non-Rapoport locus use H2’s universal-flatness argument. A DP⇔Kottwitz converse is neither used nor asserted.

**Prerequisites.** [H1/hilbert-pel-instance](#h1-hilbert-pel-instance), `PELModuli:M0/determinant-condition`, `AbelianSchemesAndArithmeticModuli:A4`.

**Acceptance checks.**

- At ramified p a trace equality alone is not accepted.
- No equality of morphisms on a nonreduced base is inferred solely from geometric points.

**Source contracts.**

- [H0/DP94](#h0-dp94), Proposition 2.7 and Corollary 2.9, pp.65–66: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H1`; namespace `TauCeti.HilbertModular`.

<a id="h1-tame-level-functors"></a>

### Hilbert tame level functors

`HilbertModularVarietiesAndShimuraCurves:H1/tame-level-functors` · definition · `TauCeti.HilbertModular.HilbertTameLevel`

Over ℤ[1/N], N≥4, the tame μ_N level is an O-linear closed immersion d⁻¹⊗_ℤμ_N→A[N]. Define the K₀(c,N), K₁(c,N) and K(c,N) variants through the corresponding finite-flat subgroup, marked quotient/Cartier-dual generator, and full lattice-level conditions. Their adelic groups are the row stabilizers of H0 with reductions respectively [[*,*],[0,*]], [[*,*],[0,1]], and I₂. The μ_N functor matches this K₁ convention, not an unexplained e₁ convention.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Specialize the imported finite-flat torsion and M1 level functors with d⁻¹ visible.
2. Use Cartier duality and the chosen row convention to identify the marked quotient and lower-right 1 subgroup.
3. Define isomorphisms and base change through M1, retaining rigidity N≥4.

**Prerequisites.** [H1/c-polarization](#h1-c-polarization), [H0/lattice-duality](#h0-lattice-duality), `AbelianSchemesAndArithmeticModuli:A3`, `PELModuli:M1/moduli-problem`.

**API.**

- `TauCeti.HilbertModular.HilbertTameLevel` (constructor): An O-linear closed immersion d⁻¹⊗μ_N→A[N], N invertible.
- `TauCeti.HilbertModular.hilbertTameLevel_pullback` (functoriality): Pullback preserves the level and closed immersion.
- `TauCeti.HilbertModular.hilbertTameLevel_K1` (compatibility): The complex lattice stabilizer is K₁(c,N) with lower-right entry 1.
- `TauCeti.HilbertModular.hilbertTameLevel_forget` (projection): The full-level, marked-quotient and subgroup levels have their compatible forgetful maps.

**Unit tests.**

- `TauCeti.HilbertModular.tame_Q` (compatibility): For F=ℚ the μ_N inclusion is the Cartier-dual version of the usual Y₁(N) marking after the stated isogeny/convention comparison.
- `TauCeti.HilbertModular.tame_badN` (non-example): If N is not invertible, the same level is not silently treated as an étale constant basis.
- `TauCeti.HilbertModular.tame_transpose` (computation): Conjugating the row convention by the standard symplectic matrix converts the marked e₂ quotient stabilizer to the e₁ stabilizer.

**Acceptance checks.**

- Every variant has its own kernel calculation and does not inherit Δ(N) automatically.

**Uses.**

- BHW§5.1.2: Identify the tame moduli fibre with its canonical Shimura variety.
- H3 unit action: Compute the stabilizer using this exact marking.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Definitions 5.2 and 5.4(1), pp.1741–1742: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H1`; namespace `TauCeti.HilbertModular`.

**Planet.** Hilbert tame level.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h1-good-representability"></a>

### Good-prime representability and universal family

`HilbertModularVarietiesAndShimuraCurves:H1/good-representability` · theorem · `TauCeti.HilbertModular.good_representability`

For the H1 PEL instance with M2’s good-prime hypotheses, the specialized moduli is a smooth separated finite-type algebraic stack. If N≥4 rigidifies all automorphisms it is an algebraic space with its descended universal HBAV. Scheme and quasi-projective assertions require the DP representability/ample hypotheses used in H2 or the later compactification supplier; they are not inferred merely from trivial inertia. The μ_N DP scheme over ℤ[1/N] is constructed in H2 at arbitrary primes.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Apply M2 only after checking the integral lattice and determinant hypotheses.
2. Check that an automorphism fixing the μ_N marking and polarization is trivial at the stipulated tame level.
3. Distinguish the representable algebraic-space statement from the stronger DP scheme statement.

**Prerequisites.** [H1/hilbert-pel-instance](#h1-hilbert-pel-instance), [H1/hilbert-determinant](#h1-hilbert-determinant), [H1/tame-level-functors](#h1-tame-level-functors), `PELModuli:M2/representability`, `PELModuli:M2/universal-family`.

**Acceptance checks.**

- No universal family is pushed through an arbitrary coarse arithmetic quotient.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), §5.1.2, pp.1744–1745: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H1`; namespace `TauCeti.HilbertModular`.

<a id="h1-linear-weil-pairing"></a>

### Linearized Hilbert Weil pairing

`HilbertModularVarietiesAndShimuraCurves:H1/linear-weil-pairing` · construction · `TauCeti.HilbertModular.linearWeilPairing`

For m invertible on S and a c-polarized HBAV, define ẽ_m:A[m]×A∨[m]→d⁻¹⊗_ℤμ_m by ẽ_m(x,y)(a)=e_m(ax,y). Under the trace identification d⁻¹≅Hom_ℤ(O,ℤ), it is perfect O-bilinear and Tr∘ẽ_m=e_m. Combining λ⁻¹ with it gives an alternating pairing on A∨[m] with target c d⁻¹⊗μ_m; equivalently its first argument is twisted by c⁻¹ and the target is d⁻¹⊗μ_m. The pairing on integral finite-flat torsion is an fppf pairing, not a pairing just of geometric points.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the A3 Weil pairing and its Rosati adjointness to make a↦e_m(ax,y) O-linear.
2. Apply the trace-dual identification; prove perfectness by the imported Cartier-dual Weil perfectness.
3. Transport through the actual λ and retain the c⁻¹ twist.

**Prerequisites.** [H1/c-polarization](#h1-c-polarization), [H0/lattice-duality](#h0-lattice-duality), `mathlib:Submodule.mem_traceDual`, `AbelianSchemesAndArithmeticModuli:A3`, `mathlib:AlgebraicGeometry.Scheme`.

**API.**

- `TauCeti.HilbertModular.linearWeilPairing` (constructor): The O-linearized pairing on A[m]×A∨[m].
- `TauCeti.HilbertModular.linearWeilPairing_trace` (compatibility): Tr(ẽ_m(x,y))=e_m(x,y).
- `TauCeti.HilbertModular.linearWeilPairing_Olinear` (structure): ẽ_m(ax,y)=a·ẽ_m(x,y)=ẽ_m(x,ay).
- `TauCeti.HilbertModular.linearWeilPairing_baseChange` (functoriality): The construction commutes with base change and compatible torsion transition maps.

**Unit tests.**

- `TauCeti.HilbertModular.weil_Q` (compatibility): For O=ℤ,d=ℤ the linearized and original Weil pairings agree.
- `TauCeti.HilbertModular.weil_codifferent` (non-example): For ramified F the target is d⁻¹⊗μ_m, rather than a canonically identified O⊗μ_m.
- `TauCeti.HilbertModular.weil_zero` (degenerate): Pairing either zero torsion section gives the identity section of μ_m and the zero additive linearization.

**Acceptance checks.**

- Trace recovers the original Weil pairing with its Tate twist.

**Uses.**

- BHW Definitions 5.7 and 8.8: Detect rational scalar pairing multipliers at full level.
- H6 torsion twists: Specify determinant and pairing compatibility.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Definition 5.6 and equation(5.1), p.1743: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H1`; namespace `TauCeti.HilbertModular`.

**Planet.** Linearized Weil pairing.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h1-pairing-choice-laws"></a>

### Pairing and ideal change laws

`HilbertModularVarietiesAndShimuraCurves:H1/pairing-choice-laws` · theorem · `TauCeti.HilbertModular.pairing_choice_laws`

At p, choose β:c⁻¹O_p≅d⁻¹(1). If β′=u β with u∈O_p× and the pulled-back pairing is b·⟨ , ⟩_β, then b′=u⁻¹b. Rescaling a c-polarization by η∈O×,+ while fixing the A∨ basis changes b to η⁻¹b. An ordered isomorphism c→c′ transports both λ and β and yields a comparison functor; totally positive multiplication and changes of roots of unity satisfy the corresponding multiplicative cocycle laws. The μ_N comparison does not make c d⁻¹(1) canonically trivial.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Compare β and u β in the determinant pairing to get b′=u⁻¹b.
2. Replace λ⁻¹ by η⁻¹λ⁻¹ to calculate polarization rescaling.
3. Use Serre tensor functoriality and multiply the scalar changes to prove the cocycle identities.

**Prerequisites.** [H1/linear-weil-pairing](#h1-linear-weil-pairing), [H1/ordered-polarization-module](#h1-ordered-polarization-module), [H1/tame-level-functors](#h1-tame-level-functors).

**Acceptance checks.**

- For u outside scalar ℤ_p×, the set of G* bases relative to a fixed β changes; the two descriptions have an explicit comparison.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Definition 5.6, equation(5.2), footnote(2), pp.1743–1744; Lemma 8.9, p.1769: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H1`; namespace `TauCeti.HilbertModular`.

<a id="h1-complex-hilbert-comparison"></a>

### Complex Hilbert moduli comparison

`HilbertModularVarietiesAndShimuraCurves:H1/complex-hilbert-comparison` · comparison · `TauCeti.HilbertModular.complex_hilbert_comparison`

For N≥4 and the selected ideal/lattice data, X(c,μ_N)_ℂ identifies with Sh_{K₁*(c,N)}(G*,X*), and the variants identify with their matching K,K₀,K₁ levels. The isomorphism is induced by polarized homology with the trace lattice and the H0 datum. It includes M3’s actual component decomposition; changing ideal representatives or β/root choices changes the displayed moduli trivialization by the H1 comparison laws.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Apply M3 to the checked Hilbert instance, using A5’s homological polarization convention.
2. Identify the lattice stabilizers through H0 and the tame marking through H1.
3. Keep the ker¹/component labels unless their vanishing is separately proved; verify every level and ideal-change map.

**Prerequisites.** [H1/hilbert-pel-instance](#h1-hilbert-pel-instance), [H1/tame-level-functors](#h1-tame-level-functors), [H1/pairing-choice-laws](#h1-pairing-choice-laws), `PELModuli:M3/complex-points`, `PELModuli:M3/algebraization-of-components`.

**Acceptance checks.**

- This is a comparison of functors and maps, not merely a bijection of unlabelled complex points.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), §5.1.2, pp.1744–1745: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H1`; namespace `TauCeti.HilbertModular`.

<a id="h2"></a>

## H2. Integral models at arbitrary p

The all-prime proof comes from the polarized O-linear local model. On each Eisenstein factor, graph charts give the flat complete-intersection equations; the singular locus has codimension at least two. Good-prime PEL smoothness does not replace this argument. The global object currently has an algebraic-space construction; the schematic refinement is an explicit closure obligation. Ordinary completion stays inside the smooth Rapoport locus.

<a id="h2-dp-local-model"></a>

### Hilbert self-orthogonal local model

`HilbertModularVarietiesAndShimuraCurves:H2/dp-local-model` · definition · `TauCeti.HilbertModular.HilbertLocalModel`

For a base S, the Hilbert local model LM_O/S classifies (O⊗𝒪_T)-submodules W⊂(O⊗𝒪_T)² which are locally direct summands of rank g as 𝒪_T-modules and satisfy W=W^⊥ for the O⊗𝒪_T-valued wedge pairing. It is the corresponding closed subscheme of the rank-g Grassmannian. Rank-one freeness over O⊗𝒪_T is an open condition, not part of the whole local model at ramified primes.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the imported Grassmannian to impose O-stability and self-orthogonality as closed conditions.
2. Use a local trivialization of the c-polarization module to identify the pairing with the standard wedge.
3. Define the open rank-one locus separately.

**Prerequisites.** [H0/lattice-duality](#h0-lattice-duality), `AlgebraicModuliForArithmeticGeometry:R09.1`.

**API.**

- `TauCeti.HilbertModular.HilbertLocalModel` (constructor): The closed self-orthogonal O-stable Grassmannian model.
- `TauCeti.HilbertModular.hilbertLocalModel_points` (characterisation): T-points are exactly the specified rank-g self-orthogonal direct summands.
- `TauCeti.HilbertModular.hilbertLocalModel_baseChange` (functoriality): Construction commutes with arbitrary base change.
- `TauCeti.HilbertModular.hilbertLocalModel_rapoport` (projection): The open rank-one O⊗𝒪_T submodule locus is the Rapoport local-model locus.

**Unit tests.**

- `TauCeti.HilbertModular.localModel_Q` (computation): For O=ℤ obtain ℙ¹_S, the space of lines in 𝒪_S².
- `TauCeti.HilbertModular.localModel_unramified` (compatibility): After an étale splitting of O at an unramified prime obtain a product ofg projective lines.
- `TauCeti.HilbertModular.localModel_ramified` (non-example): For k[T]/T², the submodule generated by Te₁ and Te₂ is self-orthogonal of k-dimension 2 but not free of rank-one over k[T]/T².

**Acceptance checks.**

- The model includes nonfree O⊗k Hodge submodules at ramified primes.

**Uses.**

- DP Theorem 3.3: Model the Hilbert deformation space étale locally.
- H2 normality: Use explicit ramified charts and their codimension-two singular locus.

**Source contracts.**

- [H0/DP94](#h0-dp94), §3.2, p.68, and§4.1, pp.70–71: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H2`; namespace `TauCeti.HilbertModular`.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h2-dp-integral-model"></a>

### Deligne–Pappas integral Hilbert model

`HilbertModularVarietiesAndShimuraCurves:H2/dp-integral-model` · construction · `TauCeti.HilbertModular.DelignePappasHilbertModel`

Fix a nonzero ordered invertible integral ideal c, N≥4 with (N,Norm(c))=1, and p∤N. The DP μ_N functor of H1, including the evaluation isomorphism, has a separated finite-type algebraic-space model over ℤ_(p), with its universal HBAV; an auxiliary sufficiently fine full tame level gives an étale presentation. Its ℚ-fibre is H1’s canonical geometric Hilbert variety. BHW’s stronger scheme formulation requires the stated scheme-representability refinement, recorded as a gap rather than attributed to good-prime M2 at ramified p.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Construct the DP functor using the imported abelian and level objects, and use DP2.1’s full-level representability.
2. Pass from a fine full tame presentation to the μ_N functor by the matching finite level quotient and effective descent.
3. Compare the generic fibre via H1; do not use M2’s good-prime smoothness to prove an arbitrary-prime statement.

**Prerequisites.** [H1/c-polarization](#h1-c-polarization), [H1/tame-level-functors](#h1-tame-level-functors), [H1/complex-hilbert-comparison](#h1-complex-hilbert-comparison), `PELModuli:M1/change-of-lattice-and-primes`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

**API.**

- `TauCeti.HilbertModular.DelignePappasHilbertModel` (constructor): The integral algebraic-space moduli object with universal HBAV.
- `TauCeti.HilbertModular.dpHilbertModel_moduli` (universal-property): Morphisms T→X_DP correspond functorially to DP c-polarized HBAVs with μ_N level over T.
- `TauCeti.HilbertModular.dpHilbertModel_genericFibre` (compatibility): Its ℚ-fibre identifies with the H1 canonical moduli variety with matching level.
- `TauCeti.HilbertModular.dpHilbertModel_changeLevel` (functoriality): Prime-to-p tame level forgetful maps and the universal family commute with pullback.

**Unit tests.**

- `TauCeti.HilbertModular.dp_Q` (compatibility): For F=ℚ,c=ℤ recover the good integral Y₁(N) moduli problem in the μ_N convention.
- `TauCeti.HilbertModular.dp_dyadic` (non-example): For F=ℚ(√2),p=2,N=5 the DP evaluation functor is allowed; the whole model is not declared smooth.
- `TauCeti.HilbertModular.dp_badTame` (non-example): N divisible byp is excluded from this prime-to-p tame construction.

**Acceptance checks.**

- Construction admits p=2 and p|disc(F).
- The scheme refinement must be proved before a scheme-only consumer executes.

**Uses.**

- H2 formal neighborhoods: Supply the arbitrary-prime base for the ordinary completion.
- H3 unit quotient: Carry the actual c-polarization and universal family before quotient.

**Source contracts.**

- [H0/DP94](#h0-dp94), §2.1, p.64; BHW§5.1.2, p.1744: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H2`; namespace `TauCeti.HilbertModular`.

**Planet.** Deligne–Pappas model.

**Closure obligations.** Arbitrary-prime DP scheme refinement; Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h2-dp-flat-normal"></a>

### Flatness and normality at every prime

`HilbertModularVarietiesAndShimuraCurves:H2/dp-flat-normal` · theorem · `TauCeti.HilbertModular.dp_flat_normal`

For the DP model at p∤N, its structure map is flat and locally a complete intersection of relative dimension g; each geometric special fibre is normal, and its nonsmooth locus has codimension at least 2. The total space over ℤ_(p) is normal. If p∤disc(F) the whole model is smooth. These assertions hold at p=2; ramified p may have singular points.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Apply Grothendieck–Messing to identify the polarized O-linear deformation functor with LM: DP3.3, including square-zero and nonreduced bases.
2. For each Eisenstein factor, use the DP4.3 graph chart with N equations in 2 N variables and special fibre dimension N to prove flat local-complete-intersection structure.
3. Use DP4.2 strata dimensions to obtain regularity in codimension-one, combine with Cohen–Macaulay S₂, and descend through the étale charts.

**Prerequisites.** [H2/dp-local-model](#h2-dp-local-model), [H2/dp-integral-model](#h2-dp-integral-model), `AbelianSchemesAndArithmeticModuli:A4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`.

**Acceptance checks.**

- The rank-one local-model stratum is smooth.
- The ramified nonfree stratum in local Model_ramified is not accidentally deleted.

**Source contracts.**

- [H0/DP94](#h0-dp94), Theorem 2.2, Corollary 2.3, Theorem 3.3, Proposition 4.4 and§4.5, pp.64–73: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H2`; namespace `TauCeti.HilbertModular`.

**Planet.** Deligne–Pappas flatness.

<a id="h2-dp-determinant-all-bases"></a>

### DP determinant identity on arbitrary bases

`HilbertModularVarietiesAndShimuraCurves:H2/dp-determinant-all-bases` · lemma · `TauCeti.HilbertModular.dp_determinant_all_bases`

The universal DP HBAV satisfies the full norm characteristic-polynomial identity for every a∈O on Lie(A). Therefore so does every pullback, including nonreduced bases. Proof uses H2 flatness and the generic H1 determinant identity; it does not infer a sheaf identity merely from field-valued points. Equivalence with a determinant-only moduli definition is a separate unresolved converse and is not needed here.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. On an étale affine presentation, write the characteristic-polynomial coefficients of the locally free Lie bundle.
2. They agree with the norm coefficients after invertingp by H1; flatness makes the coordinate ring p-torsion-free.
3. The coefficient identities descend and pull back to every test scheme.

**Prerequisites.** [H1/hilbert-determinant](#h1-hilbert-determinant), [H2/dp-flat-normal](#h2-dp-flat-normal), [H2/dp-integral-model](#h2-dp-integral-model), `AbelianSchemesAndArithmeticModuli:A4`.

**Acceptance checks.**

- The argument remains valid for a test scheme with nilpotents.

**Source contracts.**

- [H0/DP94](#h0-dp94), Proposition 2.7, p.65, and Theorem 2.2, p.64: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H2`; namespace `TauCeti.HilbertModular`.

<a id="h2-rapoport-locus"></a>

### Rapoport locus

`HilbertModularVarietiesAndShimuraCurves:H2/rapoport-locus` · definition · `TauCeti.HilbertModular.HilbertRapoportLocus`

X_R⊂X_DP is the open locus where ω_A (equivalently, via the polarized Hodge sequence, the relevant Lie module) is locally free of rank-one over O⊗𝒪_S. It has smooth structure map of relative dimension g. At unramified p it is all of X_DP; at ramified p its complement in each special fibre has codimension at least 2. No characteristic-zero embedding decomposition is imposed on a ramified integral base.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the open rank-one freeness condition on the imported differential bundle.
2. Match it to the smooth local-model stratum and use H2 étale charts.
3. Use the unramified factor splitting only where O⊗𝒪_S is étale.

**Prerequisites.** [H2/dp-integral-model](#h2-dp-integral-model), [H2/dp-local-model](#h2-dp-local-model), [H2/dp-flat-normal](#h2-dp-flat-normal), `AbelianSchemesAndArithmeticModuli:A4`.

**API.**

- `TauCeti.HilbertModular.HilbertRapoportLocus` (constructor): The open rank-one O⊗𝒪_S locus of the DP model.
- `TauCeti.HilbertModular.mem_rapoportLocus` (characterisation): Membership is local rank-one freeness of ω_A over O⊗𝒪_S.
- `TauCeti.HilbertModular.rapoportLocus_baseChange` (functoriality): The open subspace and ω commute with pullback.
- `TauCeti.HilbertModular.rapoportLocus_smooth` (structure): Its structure map is smooth of relative dimension g.

**Unit tests.**

- `TauCeti.HilbertModular.rapoport_Q` (compatibility): For F=ℚ the differential bundle is a line and X_R=X_DP.
- `TauCeti.HilbertModular.rapoport_unramified` (computation): For p∤disc(F), X_R is the whole model.
- `TauCeti.HilbertModular.rapoport_nonfree` (non-example): The k[T]/T² local-model module ⟨Te₁,Te₂⟩ fails the rank-one freeness test.

**Acceptance checks.**

- Smoothness is an assertion about this open locus.

**Uses.**

- H2 ordinary completion: Locate the smooth formal neighborhood.
- C6 conormal comparison: Supply the unsplit O⊗𝒪 module before splitting.

**Source contracts.**

- [H0/AIP16](#h0-aip16), §3.1, paragraph defining the Rapoport locus: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H2`; namespace `TauCeti.HilbertModular`.

**Planet.** Rapoport locus.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h2-ordinary-rapoport"></a>

### Ordinary locus and its Rapoport inclusion

`HilbertModularVarietiesAndShimuraCurves:H2/ordinary-rapoport` · theorem · `TauCeti.HilbertModular.ordinary_rapoport`

Define the ordinary locus by A[p^∞] having ordinary slopes 0 and 1 (height 2g, dimension g), or equivalently invertible determinant Verschiebung on ω in characteristicp, using R07.2. For every rationalp, this open lies in X_R, so its completed neighborhood has the smooth Rapoport geometry. At a ramified prime, ω is rank-one over O⊗k on this locus; it need not split into embedding lines over the integral base.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Import the intrinsic ordinary BT criterion from R07.2.
2. Apply the O-linear multiplicative/étale decomposition and the polarized ordinary deformation calculation as in AIP5.2.4 to identify ω as the rank-one O⊗k module.
3. Use openness of X_R and complete along the ordinary special-fibre open. Hida 9.1 is corroboration only under its own unramified hypotheses.

**Prerequisites.** [H2/rapoport-locus](#h2-rapoport-locus), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `AbelianSchemesAndArithmeticModuli:A4`.

**Acceptance checks.**

- F=ℚ(√2),p=2 is not excluded by the statement.

**Source contracts.**

- [H0/AIP16](#h0-aip16), §5.2.4, ordinary/Rapoport inclusion: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H2`; namespace `TauCeti.HilbertModular`.

**Planet.** Ordinary Hilbert locus.

<a id="h2-hilbert-hasse-ideal"></a>

### Hilbert Hasse ideal

`HilbertModularVarietiesAndShimuraCurves:H2/hilbert-hasse-ideal` · definition · `TauCeti.HilbertModular.HilbertHasseIdeal`

On the special fibre, specialize the generic R07.2 invariant Ha(A[p])=det(V*)∈(det ω_A)^{⊗(p−1)}. On an integral formal trivializing chart define I_Ha=(p,Ĥa), where Ĥa is any lift of that section. Changes of trivialization multiply the reduction by a unit, and changes of lift addp times a section, so these ideals glue. It defines the ordinary open by invertibility of Ha; the generic BT₁ invariant and Fargues LF remain owned by R07.2.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Import det(V*) and its base-change/ordinary criterion from R07.2.
2. Trivialize its actual determinant line, lift locally, and compare two lifts modulo p.
3. Glue the ideals using unit transition functions, retaining p=2 where the exponentp−1 is 1.

**Prerequisites.** [H2/ordinary-rapoport](#h2-ordinary-rapoport), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

**API.**

- `TauCeti.HilbertModular.HilbertHasseIdeal` (constructor): The coherent chartwise ideal (p,Ĥa) on the Hilbert formal model.
- `TauCeti.HilbertModular.hilbertHasseIdeal_lift` (characterisation): Replacing Ĥa by Ĥa+pf leaves the ideal unchanged.
- `TauCeti.HilbertModular.hilbertHasseIdeal_trivialization` (functoriality): Changing a line trivialization by a unit gives the same glued ideal.
- `TauCeti.HilbertModular.hilbertHasseIdeal_ordinary` (compatibility): Ha is invertible exactly on the intrinsic ordinary locus supplied by R07.2.

**Unit tests.**

- `TauCeti.HilbertModular.hasse_p2` (computation): At p=2 the line is det ω, with exponent 1.
- `TauCeti.HilbertModular.hasse_lift` (compatibility): The generators (p,Ĥa) and(p,Ĥa+pf) define equal ideals.
- `TauCeti.HilbertModular.hasse_supersingular` (non-example): For a supersingular elliptic fibre the invariant vanishes and the point is not ordinary.

**Acceptance checks.**

- RT-AREA-padic-1/26 is resolved by an R07.2 import, with no T0 dependency.

**Uses.**

- Adic Spaces Part II R2 specialization: Define rational Hasse domains and formal blowups.
- Hodge Tate And Canonical Subgroups T0: Only the later boundary extension is passed downstream.

**Source contracts.**

- [H0/AIP16](#h0-aip16), §3.1, Hasse invariant and formal-model paragraphs: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H2`; namespace `TauCeti.HilbertModular`.

**Planet.** Hilbert Hasse ideal.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h2-hasse-formal-domains"></a>

### Formal Hasse neighborhoods and lift independence

`HilbertModularVarietiesAndShimuraCurves:H2/hasse-formal-domains` · construction · `TauCeti.HilbertModular.hilbertHasseDomain`

For a complete p-adic base and a rational 0≤ε=a/b<1, specialize R2’s section-domain construction to det ω and Ha. On each trivializing chart take the admissible blowup chart for (Ĥa^b,p^a) in which Ĥa^b generates, with p-torsion removed; its generic fibre is |Ĥa|≥|p|^{a/b}. The chartwise models glue and the rational domain is independent of the lift. The strictε<1 is essential; no identical lift-independence assertion is made atε=1.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Apply the exact R2 construction to the Hilbert line and the ordinary formal base.
2. Compare Ĥa andĤa+pf using |p|<|p|^ε, and use the nonarchimedean triangle inequality to equate the rational subsets.
3. Use R2’s blowup/gluing result; distinguish any AIP indexed-thickening convention from the chosen ε convention.

**Prerequisites.** [H2/hilbert-hasse-ideal](#h2-hilbert-hasse-ideal), `AdicSpacesPartII:R2/section-domain-formal-model`, `AdicSpacesPartII:R2/hasse-domain`.

**API.**

- `TauCeti.HilbertModular.hilbertHasseDomain` (constructor): The formal model and adic rational domain for a/b<1.
- `TauCeti.HilbertModular.hilbertHasseDomain_genericFibre` (compatibility): Generic fibre is the inequality |Ĥa|^b≥|p|^a on each chart.
- `TauCeti.HilbertModular.hilbertHasseDomain_lift` (equivalence): Two lifts congruent modulo p determine equal rational domains forε<1.
- `TauCeti.HilbertModular.hilbertHasseDomain_monotone` (functoriality): Forε≤ε′<1 the ε-domain embeds into the ε′-domain.

**Unit tests.**

- `TauCeti.HilbertModular.hasseDomain_zero` (degenerate): ε=0 means|Ĥa|=1 on the integral generic fibre.
- `TauCeti.HilbertModular.hasseDomain_dyadic` (compatibility): The same rational inequality and lift comparison works at p=2.
- `TauCeti.HilbertModular.hasseDomain_endpoint` (non-example): Atε=1 the lifts 0 andp of the zero special-fibre section give respectively empty and whole inequality domains.

**Acceptance checks.**

- ε=0 is the ordinary unit domain.
- The ε=1 counterexample is retained.

**Uses.**

- O4 overconvergent Hilbert forms: Supply Hasse neighborhoods without an unramified-prime assumption.
- S5 Hilbert perfectoid specialization: Supply the finite-level ordinary neighborhoods; limit geometry is S5’s responsibility.

**Source contracts.**

- [H0/AIP16](#h0-aip16), §3.2, formal thickenings; compare §3.1: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H2`; namespace `TauCeti.HilbertModular`.

**Planet.** Hasse neighborhoods.

**Closure obligations.** Arbitrary-prime DP scheme refinement; Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h2-polarization-representatives-at-p"></a>

### Polarization representatives at bad primes

`HilbertModularVarietiesAndShimuraCurves:H2/polarization-representatives-at-p` · comparison · `TauCeti.HilbertModular.polarization_representatives_at_p`

For any narrow ideal class and m=p N≠0, the pinned coprime-representative theorem supplies an integral representative c with gcd(Norm(c),p N)=1. Ordered isomorphisms and H1 pairing-choice laws identify the corresponding generic and DP moduli descriptions, and composition obeys the comparison cocycle. Choosing this representative simplifies the integral lattice; it does not remove ramification of F at p or identify different narrow classes.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the pinned theorem instead of reproving approximation for narrow classes.
2. Transport the ordered polarization and tame marking along the positive ideal isomorphism.
3. Check the evaluation and local-pairing diagrams under that transport.

**Prerequisites.** `tauceti:NumberField.NarrowClassGroup.exists_mk0_eq_and_isCoprime_absNorm`, [H1/pairing-choice-laws](#h1-pairing-choice-laws), [H2/dp-integral-model](#h2-dp-integral-model).

**Acceptance checks.**

- For a nontrivial narrow class, the representative can be prime to p N without becoming principal.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Definition 5.2 and footnote(2), pp.1741,1744: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H2`; namespace `TauCeti.HilbertModular`.

<a id="h3"></a>

## H3. Arithmetic quotient and unit actions

Calculate the positive-unit action with the exact tame marking. Its kernel is the square image of tame congruence units. Ideal comparisons retain the ordered isomorphisms and their cocycles; arithmetic descent removes the positive-unit ambiguity, while Hecke correspondences can move to a different polarization class.

<a id="h3-congruence-units"></a>

### Tame congruence units

`HilbertModularVarietiesAndShimuraCurves:H3/congruence-units` · definition · `TauCeti.HilbertModular.congruenceUnits`

Let U=O× and U+=Number Field.totally Positive Integer Units F. For a nonzero integral ideal a, define U_a=ker(U→(O/a)×); for an integer M>0 write U_M=U_{MO}. Only the congruence subgroup is new; total positivity and subgroup kernels use the pinned carriers.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use reduction of units and its kernel for U_a.
2. Use the square homomorphism on the abelian unit group and the pinned positivity-of-squares theorem to construct S_M in U+.

**Prerequisites.** `tauceti:NumberField.totallyPositiveIntegerUnits`, `tauceti:NumberField.sq_mem_totallyPositiveIntegerUnits`, `mathlib:QuotientGroup.mk'`.

**API.**

- `TauCeti.HilbertModular.congruenceUnits` (constructor): The subgroup η≡1 moduloa.
- `TauCeti.HilbertModular.mem_congruenceUnits` (characterisation): η∈U_a iff(η−1)∈a.
- `TauCeti.HilbertModular.congruenceUnits_mono` (functoriality): Ifa⊂b then U_a⊂U_b.

**Unit tests.**

- `TauCeti.HilbertModular.units_Q_tame` (computation): For O=ℤ,N≥3, U_N={1} and S_N={1}.
- `TauCeti.HilbertModular.units_sign` (compatibility): Both η and−η have totally positive square, but only those congruent 1 modulo N contribute to S_N.
- `TauCeti.HilbertModular.units_squareRoot` (non-example): Congruence of η² to 1 modulo N alone does not imply η∈U_N.

**Acceptance checks.**

- The tame congruence condition applies to the square root η, not only to η².

**Uses.**

- BHW8.4: Compute Δ(N) at tame level.
- H4 connected quotients: Keep bothp-power and tame congruences on square roots.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Proposition 8.4 and Lemma 8.12, pp.1766,1771: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H3`; namespace `TauCeti.HilbertModular`.

**Planet.** Congruence units.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h3-congruence-square-image"></a>

### Congruence square image

`HilbertModularVarietiesAndShimuraCurves:H3/congruence-square-image` · definition · `TauCeti.HilbertModular.congruenceUnitSquares`

For M>0 let S_M be the image of U_M under η↦η² in the pinned subgroup U+ of totally positive units. The square-root congruence is part of this definition. The image is a normal subgroup since U+ is abelian.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use reduction of units and its kernel for U_a.
2. Use the square homomorphism on the abelian unit group and the pinned positivity-of-squares theorem to construct S_M in U+.

**Prerequisites.** [H3/congruence-units](#h3-congruence-units), `tauceti:NumberField.sq_mem_totallyPositiveIntegerUnits`.

**API.**

- `TauCeti.HilbertModular.congruenceUnitSquares` (constructor): The image S_M≤U+ of the square homomorphism on U_M.
- `TauCeti.HilbertModular.mem_congruenceUnitSquares` (characterisation): u∈S_M iff u=η² for some η∈U_M.
- `TauCeti.HilbertModular.congruenceUnitSquares_mono` (functoriality): If M divides M′, then S_{M′}≤S_M.

**Unit tests.**

- `TauCeti.HilbertModular.squareImage_Q` (computation): For F=ℚ,M≥3 the image is the trivial subgroup.
- `TauCeti.HilbertModular.squareImage_positive` (compatibility): Every image element lies in Number Field.totally Positive Integer Units F by the pinned square-positivity theorem.
- `TauCeti.HilbertModular.squareImage_root` (non-example): For F=ℚ(√2), M=12, ε⁸ is not in S_12 although ε⁸≡1 modulo 12: its only roots ±ε⁴ both fail the congruence.

**Acceptance checks.**

- The tame congruence condition applies to the square root η, not only to η².

**Uses.**

- BHW8.4: Compute Δ(N) at tame level.
- H4 connected quotients: Keep bothp-power and tame congruences on square roots.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Proposition 8.4 and Lemma 8.12, pp.1766,1771: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H3`; namespace `TauCeti.HilbertModular`.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h3-polarization-unit-action"></a>

### Positive unit action on polarizations

`HilbertModularVarietiesAndShimuraCurves:H3/polarization-unit-action` · construction · `TauCeti.HilbertModular.polarizationUnitAction`

For the fine DP μ_N object, η∈U+ sends(A,ι,λ,μ_N) to(A,ι,ηλ,μ_N). This gives an action compatible with base change and the H1 moduli comparisons. The O-linear automorphism[η] gives(A,ι,η²λ,η⁻¹μ_N,ηα)≅(A,ι,λ,μ_N,α), with the last marking on A∨. Its tame kernel is exactly S_N under this level convention.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Scale the ordered identification by a positive unit; evaluation remains an isomorphism.
2. Use Rosati adjointness and the actual dual level convention to verify the three isomorphism diagrams.
3. Prove the stabilizer in the fine μ_N functor by rigidity, obtaining squares of U_N.

**Prerequisites.** [H1/c-polarization](#h1-c-polarization), [H1/tame-level-functors](#h1-tame-level-functors), [H3/congruence-square-image](#h3-congruence-square-image), [H2/dp-integral-model](#h2-dp-integral-model).

**API.**

- `TauCeti.HilbertModular.polarizationUnitAction` (constructor): The U+ action on the c-polarized fine moduli functor.
- `TauCeti.HilbertModular.polarizationUnitAction_one` (simp): The unit 1 acts identically.
- `TauCeti.HilbertModular.polarizationUnitAction_mul` (relation): ηθ acts as η after θ.
- `TauCeti.HilbertModular.polarizationUnitAction_square` (compatibility): The displayed[η] isomorphism identifies square polarization changes with tame/dual-level scalar changes.

**Unit tests.**

- `TauCeti.HilbertModular.unitAction_Q` (degenerate): For F=ℚ the positive unit group is trivial.
- `TauCeti.HilbertModular.unitAction_negative` (non-example): −1 is not an allowed polarization-scaling unit for the standard positive cone.
- `TauCeti.HilbertModular.unitAction_level` (compatibility): η² acts trivially at tame level precisely when a root η with η≡1 modulo N supplies the moduli isomorphism.

**Acceptance checks.**

- At another tame marking, recompute the stabilizer.

**Uses.**

- H3 arithmetic quotient: Forget the chosen ordered polarization through its actual action.
- BHW8.12 and H4: Calculate its interaction with the adjugate level action.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Lemma 8.2, Definition 8.3 and Proposition 8.4, pp.1765–1766: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H3`; namespace `TauCeti.HilbertModular`.

**Planet.** Polarization unit action.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h3-tame-delta"></a>

### Finite tame polarization group

`HilbertModularVarietiesAndShimuraCurves:H3/tame-delta` · definition · `TauCeti.HilbertModular.TamePolarizationGroup`

For N≥4, define Δ(N)=U+/S_N with S_N=U_N² as in congruence Units. The quotient uses the normal subgroup inside U+, with its natural projection. It is not U+/((U+∩U_N)²), nor a quotient by units merely congruent 1 after squaring.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Form the quotient in the pinned normal-subgroup carrier.
2. Keep the square-root congruence subgroup before taking its square image.

**Prerequisites.** [H3/congruence-square-image](#h3-congruence-square-image), `mathlib:QuotientGroup.mk'`.

**API.**

- `TauCeti.HilbertModular.TamePolarizationGroup` (constructor): The quotient U+/S_N.
- `TauCeti.HilbertModular.tameDelta_mk` (projection): The projection U+→Δ(N).
- `TauCeti.HilbertModular.tameDelta_eq` (characterisation): η and θ have the same class iff ηθ⁻¹=ν² for some ν∈U_N.
- `TauCeti.HilbertModular.tameDelta_changeLevel` (functoriality): For N|M the inclusion S_M⊂S_N induces Δ(M)→Δ(N).
- `TauCeti.HilbertModular.tameDelta_lift` (universal-property): For a group J, any homomorphism U+→J killing S_N factors uniquely through tameDelta_mk.

**Unit tests.**

- `TauCeti.HilbertModular.delta_Q` (computation): For F=ℚ,N≥4, Δ(N) is trivial.
- `TauCeti.HilbertModular.delta_square` (compatibility): Every ν∈U_N maps ν² to 1 in Δ(N).
- `TauCeti.HilbertModular.delta_notPositiveRoot` (non-example): The denominator permits square roots that are not totally positive; replacing it by positive-root squares can change the quotient.

**Acceptance checks.**

- The quotient corresponds to the kernel of polarization Unit Action.

**Uses.**

- BHW8.4: The finite torsor group for X→X_G.
- H4 effective groups: The tame quotient appears in the extension E.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Proposition 8.4, p.1766: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H3`; namespace `TauCeti.HilbertModular`.

**Planet.** Tame polarization group.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h3-delta-finiteness"></a>

### Finiteness of the tame quotient

`HilbertModularVarietiesAndShimuraCurves:H3/delta-finiteness` · theorem · `TauCeti.HilbertModular.delta_finiteness`

For every M>0, Δ(M) is finite. More precisely, [U:U_M]<∞ because O/MO is finite, and finite generation of U plus the pinned square-class/unit theorem gives [U+:U_M²]<∞. For totally real F of degreeg, every subgroup of U has square-class size at most 2^g; this bound will also be used for the connected groups in H4.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the finite residue-unit target to bound the congruence index.
2. Apply the pinned Dirichlet structure theorem to U_M and its finite torsion subgroup; do not repeat that theorem as a node.
3. Combine subgroup indices with positivity of unit squares.

**Prerequisites.** [H3/tame-delta](#h3-tame-delta), `tauceti:NumberField.units_sq_index_eq`, `tauceti:NumberField.unitsMulEquivTorsionProdMultiplicative`.

**Acceptance checks.**

- Finiteness does not prove an arbitrary natural map between two square quotients is injective.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Proposition 8.4, p.1766: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H3`; namespace `TauCeti.HilbertModular`.

**Planet.** Finite polarization quotient.

<a id="h3-arithmetic-quotient"></a>

### Arithmetic Hilbert quotient

`HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient` · theorem · `TauCeti.HilbertModular.arithmetic_quotient`

With the exact μ_N convention, X(c,μ_N)→X_G(c,μ_N) is a finite étale Δ(N)-torsor, and its quotient identifies with the G canonical Hilbert variety through V8. For the integral model the quotient exists in the stated category and has the characteristic-zero comparison. A universal HBAV on the fine source descends only when its descent datum is verified; no universal HBAV is asserted on an arbitrary coarse arithmetic quotient.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the exact stabilizer calculation to factor the action through Δ(N).
2. Prove the quotient-moduli and torsor diagrams on test objects, including rigidifying tame marking.
3. Apply the imported effective finite quotient and V8 comparison with the G datum; keep stack/coarse and fine-family claims distinct.

**Prerequisites.** [H3/polarization-unit-action](#h3-polarization-unit-action), [H3/delta-finiteness](#h3-delta-finiteness), [H1/complex-hilbert-comparison](#h1-complex-hilbert-comparison), `ShimuraVarieties:V8/finite-level-maps`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

**Acceptance checks.**

- For F=ℚ the quotient map is an isomorphism.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Proposition 8.4, p.1766: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H3`; namespace `TauCeti.HilbertModular`.

**Planet.** Arithmetic Hilbert quotient.

<a id="h3-ideal-class-comparisons"></a>

### Polarization ideal representative comparisons

`HilbertModularVarietiesAndShimuraCurves:H3/ideal-class-comparisons` · comparison · `TauCeti.HilbertModular.ideal_class_comparisons`

The disjoint union of Hilbert moduli over a list of narrow ideal-class representatives has explicit comparison isomorphisms for a new list: choose ordered ideal isomorphisms and transport λ, lattices and β. Their composites obey H1’s cocycle; changing the comparison by a totally positive unit acts on the G* description and disappears after the G polarization-class quotient. Different ideal classes remain different labels.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the pinned narrow-class finiteness to form the finite list.
2. Apply the ordered ideal isomorphism comparison on each class and verify pairings and marking.
3. Track the unit ambiguity explicitly before and after the arithmetic quotient.

**Prerequisites.** [H1/pairing-choice-laws](#h1-pairing-choice-laws), [H2/polarization-representatives-at-p](#h2-polarization-representatives-at-p), [H3/arithmetic-quotient](#h3-arithmetic-quotient), `tauceti:NumberField.NarrowClassGroup.instFinite`.

**Acceptance checks.**

- Class number one is not a standing hypothesis.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), §8.4.1, pp.1777–1778, ideal dependence before Lemma 8.22: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H3`; namespace `TauCeti.HilbertModular`.

<a id="h3-hilbert-hecke-isogenies"></a>

### Hecke isogenies between polarization components

`HilbertModularVarietiesAndShimuraCurves:H3/hilbert-hecke-isogenies` · theorem · `TauCeti.HilbertModular.hilbert_hecke_isogenies`

For an O-linear finite locally free subgroup D⊂A[a], witha prime to N and the required isotropy/polarization descent conditions, the quotientφ:A→B=A/D has the induced HBAV structure and tame marking. If D has O-module elementary divisors O/b_i, putb=∏b_i; the descended polarization module iscb and the dual-isogeny diagram of BHW(8.7) characterizes λ′. These correspondences act on the union ofc-components, not necessarily on onec-component, and have representative-independent arithmetic descent.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use A3’s quotient and dual isogeny; carry μ_N throughφ since(a,N)=1.
2. Prove the polarization descent and the cb evaluation diagram for a cyclic elementary divisor, then compose the factors.
3. Transport representative changes through that diagram and descend the unit ambiguity using H3. The source’s Kisin–Lai§1.9 descent argument needs a precise transcription, recorded as a source-proof gap.

**Prerequisites.** [H3/ideal-class-comparisons](#h3-ideal-class-comparisons), [H1/linear-weil-pairing](#h1-linear-weil-pairing), `AbelianSchemesAndArithmeticModuli:A3`.

**Acceptance checks.**

- A correspondence with nontrivial narrow class[b] moves the polarization component.
- The quotient of geometric torsion points alone is not an integral subgroup-scheme construction.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Lemma 8.22 and diagram(8.7), pp.1777–1778: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H3`; namespace `TauCeti.HilbertModular`.

**Closure obligations.** Hecke polarization descent proof interior. See the closure ledger.

<a id="h4"></a>

## H4. Finite p-level structures and effective groups

Use paired scalar-multiplier G* frames, unrestricted hybrid frames and polarization-class G frames as separate generic moduli. Adjugation reverses composition and produces the BHW left action. Finite scalar kernels determine PΓ and the joint diagonal group E. The whole-space and connected torsors have different groups. The connected inverse limit is finite, but the correct eventual description is by stable images.

<a id="h4-hybrid-full-level"></a>

### Hybrid full Hilbert level

`HilbertModularVarietiesAndShimuraCurves:H4/hybrid-full-level` · definition · `TauCeti.HilbertModular.HilbertHybridLevel`

Over characteristic-zero S with a fixed c-polarization and μ_N marking, a hybrid fullp^n level is an O/p^n O-linear isomorphism α_n:(O/p^n O)²≅A∨[p^n], n≥1. Denote its fine moduli by X_Γ(p^n). It retains λ and allows an arbitrary O-unit Weil multiplier. This is a generic-fibre basis; no such constant étale basis is imposed on characteristicp torsion.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Specialize the M1 finite étale frame functor to A∨[p^n].
2. Keep the c-polarization and μ_N marking on each object.
3. Use H1’s good characteristic-zero comparison for representability.

**Prerequisites.** [H1/c-polarization](#h1-c-polarization), [H1/tame-level-functors](#h1-tame-level-functors), [H1/linear-weil-pairing](#h1-linear-weil-pairing), `AbelianSchemesAndArithmeticModuli:A3`, `PELModuli:M1/moduli-problem`.

**API.**

- `TauCeti.HilbertModular.HilbertHybridLevel` (constructor): A full O/p^n O basis of A∨[p^n] on the geometric c-polarized moduli.
- `TauCeti.HilbertModular.hybridLevel_forget` (projection): Forgetα_n to the fine tame c-polarized moduli.
- `TauCeti.HilbertModular.hybridLevel_reduce` (functoriality): Forr≤n use[p^{n−r}] on torsion and reduction of the basis to obtainα_r.
- `TauCeti.HilbertModular.hybridLevel_dualConvention` (compatibility): λ⁻¹∘(α_n⊗c⁻¹) identifies the corresponding basis of A[p^n] only after the c⁻¹ twist.

**Unit tests.**

- `TauCeti.HilbertModular.hybrid_Q` (compatibility): For F=ℚ,c=ℤ obtain the usual full generic elliptic level on the dual curve.
- `TauCeti.HilbertModular.hybrid_twist` (non-example): For nonprincipal c a basis of A∨[p^n] does not canonically give an untwisted basis of A[p^n].
- `TauCeti.HilbertModular.hybrid_charp` (non-example): For an ordinary elliptic curve in characteristicp, E[p] includes μ_p and is not a constant étale rank p² group.

**Acceptance checks.**

- The target of the basis is A∨, matching the downstream Hodge–Tate map.

**Uses.**

- BHW§8.2: The intermediate space separates scalar pairing restriction from polarization-class descent.
- S5/O4: Provide the finite-level frame data on T_p A∨.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Definition 5.4(4), Remark 5.5 and§8.2, pp.1742,1768: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H4`; namespace `TauCeti.HilbertModular`.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h4-pairing-multiplier"></a>

### Hilbert full-level pairing multiplier

`HilbertModularVarietiesAndShimuraCurves:H4/pairing-multiplier` · construction · `TauCeti.HilbertModular.hilbertPairingMultiplier`

For a compatible local generator β:c⁻¹O_p≅d⁻¹(1), pull backẽ_{p^n} using λ⁻¹(α_n⊗c⁻¹) andα_n. There is a unique b_n∈(O/p^n O)× such that this pairing is b_n times the β-determinant pairing. The construction is a mape_{n,β}:X_Γ(p^n)→(O/p^n O)×, compatible with torsion reduction. β is an auxiliary trivialization, with the exact change law of H1.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use perfect alternating O-linear forms on a rank-two free residue module to obtain a unique unit ratio.
2. Use β to express that ratio and H1’s law to compare choices.
3. Check the ratio under every reduction map, rather than choosing β independently at each n.

**Prerequisites.** [H4/hybrid-full-level](#h4-hybrid-full-level), [H1/linear-weil-pairing](#h1-linear-weil-pairing), [H1/pairing-choice-laws](#h1-pairing-choice-laws).

**API.**

- `TauCeti.HilbertModular.hilbertPairingMultiplier` (constructor): The unique unit ratio of the pulled-back pairing to the β pairing.
- `TauCeti.HilbertModular.hilbertPairingMultiplier_eq` (characterisation): e_{n,β}(α)=b iff the two forms differ by multiplication byb.
- `TauCeti.HilbertModular.hilbertPairingMultiplier_reduce` (functoriality): The multiplier reduces compatibly fromp^n top^r.
- `TauCeti.HilbertModular.hilbertPairingMultiplier_changeBeta` (compatibility): Replacing β byu β replaces the multiplier byu⁻¹b.

**Unit tests.**

- `TauCeti.HilbertModular.multiplier_identity` (computation): A basis carrying the β form to the actual pairing has multiplier 1.
- `TauCeti.HilbertModular.multiplier_change` (compatibility): β′=u β givesb′=u⁻¹b.
- `TauCeti.HilbertModular.multiplier_nonscalar` (non-example): For a nonscalar residue unitu the multiplieru is not a G* multiplier relative to the fixed β.

**Acceptance checks.**

- The multiplier is an O-unit; rational scalar units are a separate restriction.

**Uses.**

- BHW Lemma 8.10: Cut out the G* full-level subspace.
- H4 components: Label connected components by the actual pairing ratio.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Definition 5.6, equation(5.2), p.1743; equation(8.4), p.1769: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H4`; namespace `TauCeti.HilbertModular`.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h4-geometric-full-level"></a>

### Scalar-similitude geometric full level

`HilbertModularVarietiesAndShimuraCurves:H4/geometric-full-level` · definition · `TauCeti.HilbertModular.HilbertGeometricFullLevel`

Let S_n be the image of(ℤ/p^n ℤ)× in(O/p^n O)×. Define X_Γ*(p^n)=e_{n,β}^{−1}(S_n) inside the hybrid moduli. Its bases are the G* full-level structures of BHW Definition 5.7, and its acting level group is{γ∈GL₂(O/p^n O):det γ∈S_n}. A choice of one root/multiplier component is further data and is not folded into this definition.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Take the inverse image of the scalar residue-unit subgroup under the actual multiplier map.
2. Use the trace dictionary to check agreement with the rational-similitude definition.
3. Keep the union of scalar multiplier components until a component is explicitly selected.

**Prerequisites.** [H4/pairing-multiplier](#h4-pairing-multiplier), [H0/type-witnesses](#h0-type-witnesses).

**API.**

- `TauCeti.HilbertModular.HilbertGeometricFullLevel` (constructor): The scalar-multiplier subfunctor of hybrid full level.
- `TauCeti.HilbertModular.geometricFullLevel_mem` (characterisation): A basis is geometric full level iff its multiplier belongs to S_n.
- `TauCeti.HilbertModular.geometricFullLevel_inclusion` (projection): The natural inclusion β₁ into the hybrid space.
- `TauCeti.HilbertModular.geometricFullLevel_betaTransport` (equivalence): H1’s comparison identifies the subfunctors for two compatible β choices after the stated basis transport.

**Unit tests.**

- `TauCeti.HilbertModular.starLevel_Q` (compatibility): For F=ℚ,S_n=(O/p^n O)×, so geometric and hybrid full levels coincide.
- `TauCeti.HilbertModular.starLevel_missing` (non-example): For g>1 with nonscalar residue units,β₁ misses their multiplier fibres and is not surjective.
- `TauCeti.HilbertModular.starLevel_root` (non-example): Fixing one primitive root picks one scalar multiplier component; the entire G* definition does not fix that root.

**Acceptance checks.**

- The G* space is an open-and-closed subspace of the hybrid generic space.

**Uses.**

- BHW8.10–8.11: Describe β₁ and reconstruct the hybrid space by scalar induction.
- S5 geometric tower: Supply precisely the G* finite-level moduli.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Definition 5.7, p.1743; Lemma 8.10, p.1770: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H4`; namespace `TauCeti.HilbertModular`.

**Planet.** Geometric full level.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h4-adjugate-level-action"></a>

### Adjugate action on dual levels

`HilbertModularVarietiesAndShimuraCurves:H4/adjugate-level-action` · theorem · `TauCeti.HilbertModular.adjugate_level_action`

For γ∈GL₂(O/p^n O), let γ∨=adj(γ)=det γ·γ⁻¹. The rule γ·α=α∘γ∨ gives a left action on hybrid levels because adj(γδ)=adj δ·adj γ. It changes the pairing multiplier bydet γ, since det(adj γ)=det γ in rank-two. Scaling λ by η∈U+ changes that multiplier by η⁻¹. The actions commute; the G* action is obtained by the scalar determinant restriction.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Reuse the pinned adjugate anti-multiplicativity and rank-two determinant formula.
2. Compute the pulled-back alternating form underα∘adj γ.
3. Apply H1’s λ-rescaling law to obtain η⁻¹ and verify commuting actions.

**Prerequisites.** [H4/hybrid-full-level](#h4-hybrid-full-level), [H4/pairing-multiplier](#h4-pairing-multiplier), [H3/polarization-unit-action](#h3-polarization-unit-action), `mathlib:Matrix.adjugate_mul_distrib`, `mathlib:Matrix.det_adjugate`.

**Acceptance checks.**

- Composition order is checked with two noncommuting matrices.
- A determinantp matrix acts on Tate modules through the isogeny correspondence, not an invertible finite-level frame action.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Remark 5.8 and Lemma 8.9, pp.1744,1769–1770: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H4`; namespace `TauCeti.HilbertModular`.

**Planet.** Adjugate level action.

<a id="h4-unit-square-level"></a>

### Unit squares versus scalar levels

`HilbertModularVarietiesAndShimuraCurves:H4/unit-square-level` · lemma · `TauCeti.HilbertModular.unit_square_level`

For η∈U_N, its polarization action by η² on the hybrid full-level space equals the level action of the scalar matrix η⁻¹I₂. Consequently the kernel at fullp^n level is S_{p^n N}=U_{p^n N}². This statement uses the dual-level action and the fixed tame μ_N convention; it is recalculated for another tame level.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Insert η into the H3 HBAV isomorphism diagrams.
2. Because η∈U_N the tame marking is unchanged; for a scalar rank-two matrix adj(ηI)=ηI.
3. The scalar acts trivially onα_n exactly when η≡1 modulo p^n, andp∤N combines the congruences.

**Prerequisites.** [H4/adjugate-level-action](#h4-adjugate-level-action), [H3/polarization-unit-action](#h3-polarization-unit-action), [H3/congruence-square-image](#h3-congruence-square-image).

**Acceptance checks.**

- The exponent 2 belongs to the polarization change, while the scalar-level action uses η⁻¹.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Lemma 8.12, p.1771: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H4`; namespace `TauCeti.HilbertModular`.

<a id="h4-arithmetic-full-level"></a>

### Arithmetic full Hilbert level

`HilbertModularVarietiesAndShimuraCurves:H4/arithmetic-full-level` · definition · `TauCeti.HilbertModular.HilbertArithmeticFullLevel`

Define X_{G,Γ(p^n)} as the polarization-class quotient of the hybrid fine moduli by Δ(p^n N)=U+/U_{p^n N}². Its coarse moduli interpretation retains(A,ι,[λ],μ_N,α_n), with isomorphisms acting on the dual basis. Denote β₂ the quotient map. A local HBAV representative may be used for this interpretation; no universal HBAV on the whole arithmetic quotient is part of this definition.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the exact full-level kernel and the finite quotient supplied by R09.5.
2. Check the polarization-class coarse interpretation with its dual-level isomorphism convention.
3. Compare β₂ to the G canonical finite-level map by V8.

**Prerequisites.** [H4/hybrid-full-level](#h4-hybrid-full-level), [H4/unit-square-level](#h4-unit-square-level), [H3/tame-delta](#h3-tame-delta), [H3/delta-finiteness](#h3-delta-finiteness), `AlgebraicModuliForArithmeticGeometry:R09.5`.

**API.**

- `TauCeti.HilbertModular.HilbertArithmeticFullLevel` (constructor): The quotient X_Γ(p^n)/Δ(p^n N).
- `TauCeti.HilbertModular.arithmeticFullLevel_quotient` (universal-property): Invariant maps from the hybrid space factor uniquely through β₂.
- `TauCeti.HilbertModular.arithmeticFullLevel_reduce` (functoriality): The level reductions commute with the corresponding Δ quotient maps.
- `TauCeti.HilbertModular.arithmeticFullLevel_coarse` (compatibility): Geometric points have the stated polarization-class and dual-basis interpretation.

**Unit tests.**

- `TauCeti.HilbertModular.arithmeticLevel_Q` (compatibility): For F=ℚ the positive-unit quotient is trivial and all three full levels agree.
- `TauCeti.HilbertModular.arithmeticLevel_beta1` (non-example): The composite β₂β₁ need not be surjective and is not called a torsor merely because β₂ is one.
- `TauCeti.HilbertModular.arithmeticLevel_universal` (non-example): The coarse interpretation supplies no automatic descended universal abelian scheme.

**Acceptance checks.**

- β₂ is a finite étale torsor for Δ(p^n N) under the fine tame hypotheses.

**Uses.**

- BHW8.16 and 8.18: Compute the arithmetic level torsor and its effective group.
- S5/O4: Separate full-tower and connected-component polarization quotients.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Lemma 8.16(1), p.1772: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H4`; namespace `TauCeti.HilbertModular`.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h4-hybrid-comparison-map"></a>

### Induction from scalar pairing components

`HilbertModularVarietiesAndShimuraCurves:H4/hybrid-comparison-map` · comparison · `TauCeti.HilbertModular.hybrid_comparison_map`

For fixed β, X_Γ(p^n)≅[(O/p^n O)××X_Γ*(p^n)]/S_n, where a residue unitu acts throughdiag(u,1) and S_n acts antidiagonally. Thus β₁ is the scalar-multiplier inclusion and β₂ is the unit polarization quotient; their distinct images and groups are visible. The assertion is on the generic fibre with compatible pairings.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Translate a multiplierb to a scalar multiplier usingdiag(b,1).
2. Compute the ambiguity as S_n using the H4 determinant action.
3. Check the induced quotient isomorphism on finite étale frame functors and after base change.

**Prerequisites.** [H4/geometric-full-level](#h4-geometric-full-level), [H4/adjugate-level-action](#h4-adjugate-level-action), [H4/arithmetic-full-level](#h4-arithmetic-full-level).

**Acceptance checks.**

- Over ℚ induction by equal residue/scalar unit groups adds no extra components.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Corollary 8.11, p.1771: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H4`; namespace `TauCeti.HilbertModular`.

<a id="h4-integral-gamma0"></a>

### Integral Iwahori and higher subgroup levels

`HilbertModularVarietiesAndShimuraCurves:H4/integral-gamma0` · definition · `TauCeti.HilbertModular.HilbertIntegralGamma0`

An integral Γ₀(p^n) level is a finite locally free O-stable subgroup C⊂A[p^n] of rank p^{ng}, such that every c-indexed polarized Weil pairing vanishes on C×C. Require its generic fibre C[1/p] to be étale locally O/p^n O of rank one. The inclusion C⊂A[p^n] imposes p^n-annihilation; any stronger ideal-annihilator or flat-closure refinement is the recorded comparison gap. For a naive integral functor retain precisely these conditions; any flat closure or refined local-model variant is separately stated.Γ₁ is an integral generator condition only when its group-scheme formulation has been specified; a full constant basis is restricted to the generic fibre.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the imported finite-flat subgroup and pairing carriers to state rank, O-stability and isotropy.
2. Check the rank-one residue-module type after invertingp.
3. Keep the integral naive functor separate from any claim of flatness or a splitting-model identification.

**Prerequisites.** [H2/dp-integral-model](#h2-dp-integral-model), [H1/linear-weil-pairing](#h1-linear-weil-pairing), `AbelianSchemesAndArithmeticModuli:A3`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

**API.**

- `TauCeti.HilbertModular.HilbertIntegralGamma0` (constructor): The finite locally free O-stable isotropic subgroup-scheme level.
- `TauCeti.HilbertModular.integralGamma0_baseChange` (functoriality): Subgroup, rank and isotropy pull back to any base.
- `TauCeti.HilbertModular.integralGamma0_generic` (compatibility): On the generic fibre it is the stated O/p^n O rank-one subgroup level.
- `TauCeti.HilbertModular.integralGamma0_forget` (projection): The nested subgroup levels have forgetful maps, with their actual subgroup intersections.

**Unit tests.**

- `TauCeti.HilbertModular.gamma0_ordinary` (computation): For an ordinary elliptic curve, the multiplicative μ_{p^n} subgroup is a valid rank p^n integral Γ₀ level.
- `TauCeti.HilbertModular.gamma0_zero` (non-example): The zero subgroup has the wrong rank for n≥1.
- `TauCeti.HilbertModular.gamma0_points` (non-example): Replacing μ_p by its geometric points loses its scheme rank and fails the test.

**Acceptance checks.**

- Atp=2 or a ramified prime subgroup schemes remain meaningful.

**Uses.**

- H2/R18.2 integral level consumers: Provide actual subgroup-scheme data at bad primes.
- BHW8.5 and 8.18: Compare generic Γ₀ levels for G* and G.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Definition 5.4(2–3), p.1742; integral refinement required by roadmap H4: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H4`; namespace `TauCeti.HilbertModular`.

**Closure obligations.** Integral Γ₀ annihilator and closure comparison; Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h4-gamma0-cartesian"></a>

### Polarization quotient at subgroup level

`HilbertModularVarietiesAndShimuraCurves:H4/gamma0-cartesian` · comparison · `TauCeti.HilbertModular.gamma0_cartesian`

On the generic fibre, the Γ₀(p^n) subgroup-level squares over X→X_G are Cartesian: units preserve O-stable C, so the same Δ(N) torsor acts before and after adjoining C. Any invariant rational Hasse neighborhood restricts this finite-level Cartesian diagram. No perfectoid limit theorem is proved or imported here.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use ηC=C for O-stable subgroups in the H3 moduli isomorphism.
2. Check the quotient functor Cartesian square.
3. Restrict to the Hasse domain after verifying invariance of Ha under polarization changes.

**Prerequisites.** [H4/integral-gamma0](#h4-integral-gamma0), [H3/arithmetic-quotient](#h3-arithmetic-quotient), [H2/hasse-formal-domains](#h2-hasse-formal-domains).

**Acceptance checks.**

- This is a finite-level input to S5, with no backward dependence on S5.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Lemma 8.5, p.1766: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H4`; namespace `TauCeti.HilbertModular`.

<a id="h4-connected-unit-groups"></a>

### Connected polarization and residue component groups

`HilbertModularVarietiesAndShimuraCurves:H4/connected-unit-groups` · definition · `TauCeti.HilbertModular.ConnectedPolarizationGroup`

For n≥1 put A_n=U_{p^n}∩U+, B_n=U_{p^n N}, and Δ_n(N)=A_n/B_n². For r≤n inclusion induces Δ_n→Δ_r; these maps need be neither injective nor surjective. This group preserves a selected paired component and differs from the whole-space quotient Δ(p^n N)=U+/B_n².

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use B_n²⊂A_n and form its normal-subgroup quotient.
2. Use the nested congruence subgroups to define and compose transition homomorphisms.
3. Keep the connected numerator A_n separate from the full positive-unit numerator.

**Prerequisites.** [H3/congruence-square-image](#h3-congruence-square-image), [H3/tame-delta](#h3-tame-delta), `mathlib:QuotientGroup.mk'`.

**API.**

- `TauCeti.HilbertModular.ConnectedPolarizationGroup` (constructor): A_n/B_n² with the indicated level transitions.
- `TauCeti.HilbertModular.connectedDelta_eq` (characterisation): Classes of η,θ∈A_n agree iff ηθ⁻¹=ν² for ν∈B_n.
- `TauCeti.HilbertModular.connectedDelta_transition` (functoriality): Reduction fromn tor is induced by inclusion and satisfies identity/composition laws.

**Unit tests.**

- `TauCeti.HilbertModular.connectedDelta_Q` (computation): For F=ℚ all Δ_n(N) are trivial.
- `TauCeti.HilbertModular.connectedDelta_noninjective` (non-example): For F=ℚ(√2),p=3,N=4 the inclusion-induced Δ₁(4)→Δ(4) is not injective, as demonstrated in the counterexample node.
- `TauCeti.HilbertModular.connectedDelta_square` (compatibility): For η∈U_{p^n N}, the class of η² is trivial in Δ_n(N).

**Acceptance checks.**

- Definitions acceptp=2 and keep the fullp^n N square-root congruence.

**Uses.**

- BHW8.15–8.16: Identify the arithmetic component labels and the torsor on a chosen component.
- S5/O4: Receive the correct finite connected limit rather than the full profinite quotient.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Definition 8.14 and Lemma 8.16, pp.1771–1773: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H4`; namespace `TauCeti.HilbertModular`.

**Planet.** Connected polarization groups.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h4-residue-component-group"></a>

### Residue polarization components

`HilbertModularVarietiesAndShimuraCurves:H4/residue-component-group` · definition · `TauCeti.HilbertModular.ResiduePolarizationComponents`

For n≥1 define 𝒰_n=(O/p^n O)×/image(U+), using reduction of the pinned totally positive units. This is the fixed-c arithmetic multiplier-component group; over all polarization classes it occurs as the kernel in the narrow ray-class extension.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Form the two quotients on their explicit subgroup carriers.
2. Use B_n²⊂A_n and the nested subgroup inclusions to define level transition maps.
3. Keep the inclusion A_n⊂U+ separate from any injectivity claim after quotienting.

**Prerequisites.** [H3/congruence-units](#h3-congruence-units), `mathlib:QuotientGroup.mk'`.

**API.**

- `TauCeti.HilbertModular.ResiduePolarizationComponents` (constructor): The quotient of residue units by the positive-unit image.
- `TauCeti.HilbertModular.residueComponents_mk` (projection): The residue-unit projection to 𝒰_n.
- `TauCeti.HilbertModular.residueComponents_eq` (characterisation): Two units have equal classes iff their ratio is the reduction of a totally positive global unit.
- `TauCeti.HilbertModular.residueComponents_reduce` (functoriality): Residue reduction induces compatible maps 𝒰_n→𝒰_r for r≤n.

**Unit tests.**

- `TauCeti.HilbertModular.residueComponents_Q` (computation): For F=ℚ the image is {1}, so 𝒰_n=(ℤ/p^n ℤ)×.
- `TauCeti.HilbertModular.residueComponents_unit` (compatibility): Reduction of every positive global unit has trivial class.
- `TauCeti.HilbertModular.residueComponents_narrow` (non-example): The group for fixed c omits nontrivial narrow ideal classes and is not the whole arithmetic component set.

**Acceptance checks.**

- Definitions acceptp=2 and keep the fullp^n N square-root congruence.

**Uses.**

- BHW8.15–8.16: Identify the arithmetic component labels and the torsor on a chosen component.
- S5/O4: Receive the correct finite connected limit rather than the full profinite quotient.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Definition 8.14 and Lemma 8.16, pp.1771–1773: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H4`; namespace `TauCeti.HilbertModular`.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h4-component-and-torsor-comparison"></a>

### Full and connected component comparisons

`HilbertModularVarietiesAndShimuraCurves:H4/component-and-torsor-comparison` · theorem · `TauCeti.HilbertModular.component_and_torsor_comparison`

With BHW’s fixedc and tame μ_N convention, after a splitting/cyclotomic base and the required component choice, π₀(X_Γ*(p^n))=(ℤ/p^n ℤ)×, π₀(X_Γ(p^n))=(O/p^n O)×, and π₀(X_{G,Γ(p^n)})=𝒰_n for thatc-fibre. Over allc classes the arithmetic labels form the narrow ray-class extension by Cl⁺(O).β₂ is a Δ(p^n N) torsor on the whole space and a Δ_n(N) torsor on paired chosen components. Base-field Galois actions on the labels are retained.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use strong approximation for the imported derived Res SL₂ group and compute determinant double cosets at this exact tame level.
2. Use the multiplier induction comparison to pass from scalar to O-unit labels.
3. Compute the subgroup preserving the selected multiplier component and divide its scalar kernel, giving A_n/B_n².

**Prerequisites.** [H4/connected-unit-groups](#h4-connected-unit-groups), [H4/hybrid-comparison-map](#h4-hybrid-comparison-map), [H3/ideal-class-comparisons](#h3-ideal-class-comparisons), [H4/arithmetic-full-level](#h4-arithmetic-full-level), `ShimuraVarieties:V8/finite-level-maps`, `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, [H4/residue-component-group](#h4-residue-component-group).

**Acceptance checks.**

- The geometric G* full space may have several scalar multiplier components even when the tame source is connected.
- Only the fixed[c] fibre has labels 𝒰_n; the full arithmetic variety also sees Cl⁺(O).

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Lemmas 8.15–8.16, pp.1771–1773: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H4`; namespace `TauCeti.HilbertModular`.

<a id="h4-effective-level-groups"></a>

### Effective finite level groups

`HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups` · definition · `TauCeti.HilbertModular.HilbertFiniteGamma0`

For 0≤m≤n, n≥1, define Γ₀(p^m,p^n)={γ∈GL₂(O/p^n O): γ₂₁∈p^m O/p^n O}. Its Γ₀* subgroup imposes determinant in the scalar image of (ℤ/p^n ℤ)×. These act on generic full-level frames and forget to the stipulated subgroup level.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the lower-left congruence and the scalar determinant condition to define the matrix subgroups.
2. Identify the image of U_N by its kernel U_{p^n N}.
3. Form the two central quotients with the exact combined action relation.

**Prerequisites.** [H4/adjugate-level-action](#h4-adjugate-level-action), [H4/unit-square-level](#h4-unit-square-level), [H3/congruence-square-image](#h3-congruence-square-image), `mathlib:QuotientGroup.mk'`.

**API.**

- `TauCeti.HilbertModular.HilbertFiniteGamma0` (constructor): The lower-left congruence subgroup of GL₂(O/p^n O).
- `TauCeti.HilbertModular.finiteGamma0_mem` (characterisation): Membership is exactly the lower-left ideal condition.
- `TauCeti.HilbertModular.finiteGamma0_star` (constructor): The scalar-determinant subgroup Γ₀*≤Γ₀.

**Unit tests.**

- `TauCeti.HilbertModular.gamma0_m0` (degenerate): For m=0 the lower-left condition is void and Γ₀=GL₂(O/p^n O).
- `TauCeti.HilbertModular.gamma0_mn` (computation): For m=n the lower-left entry is 0 in O/p^n O.
- `TauCeti.HilbertModular.effective_Q` (compatibility): For F=ℚ,N≥4, U_N={1}; hence Z_n is trivial and PΓ₀=Γ₀.

**Acceptance checks.**

- Γ₀ has an ineffective scalar subgroup on the arithmetic quotient, while the hybrid frame action is effective.

**Uses.**

- BHW8.18–8.19: State the finite étale torsors over subgroup level.
- O4 descent: Use an effective arithmetic finite-level group.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Definition 8.17 and§8.3.1, pp.1773–1775: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H4`; namespace `TauCeti.HilbertModular`.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h4-diagonal-level-group"></a>

### Diagonal level and polarization group

`HilbertModularVarietiesAndShimuraCurves:H4/diagonal-level-group` · definition · `TauCeti.HilbertModular.HilbertDiagonalLevelGroup`

Define E(p^m,p^n)=(Γ₀(p^m,p^n)×U+)/image(η↦(ηI₂,η²), η∈U_N). The subgroup is central. For the left adjugate frame action and positive polarization action this is exactly the joint ineffective subgroup.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the lower-left congruence and the scalar determinant condition to define the matrix subgroups.
2. Identify the image of U_N by its kernel U_{p^n N}.
3. Form the two central quotients with the exact combined action relation.

**Prerequisites.** [H4/effective-level-groups](#h4-effective-level-groups), [H4/unit-square-level](#h4-unit-square-level), [H3/congruence-square-image](#h3-congruence-square-image), `mathlib:QuotientGroup.mk'`.

**API.**

- `TauCeti.HilbertModular.HilbertDiagonalLevelGroup` (constructor): The central quotient E by the square relation.
- `TauCeti.HilbertModular.diagonalLevel_mk` (projection): The product-group projection to E.
- `TauCeti.HilbertModular.diagonalLevel_relation` (characterisation): (ηI₂,η²) maps to 1 for η∈U_N; these generate exactly the kernel.
- `TauCeti.HilbertModular.diagonalLevel_action` (compatibility): The joint level/polarization action factors through E using H4’s unit-square calculation.

**Unit tests.**

- `TauCeti.HilbertModular.diagonal_Q` (computation): For F=ℚ,N≥4, E=Γ₀.
- `TauCeti.HilbertModular.diagonal_square` (compatibility): Its second coordinate is η², matching Rosati polarization scaling.
- `TauCeti.HilbertModular.diagonal_notLinear` (non-example): The relation (ηI₂,η) generally changes the paired moduli and is not substituted.

**Acceptance checks.**

- Γ₀ has an ineffective scalar subgroup on the arithmetic quotient, while the hybrid frame action is effective.

**Uses.**

- BHW8.18–8.19: State the finite étale torsors over subgroup level.
- O4 descent: Use an effective arithmetic finite-level group.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Definition 8.17 and§8.3.1, pp.1773–1775: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H4`; namespace `TauCeti.HilbertModular`.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h4-projective-level-group"></a>

### Effective projective level group

`HilbertModularVarietiesAndShimuraCurves:H4/projective-level-group` · definition · `TauCeti.HilbertModular.HilbertEffectiveGamma0`

Define PΓ₀(p^m,p^n)=Γ₀(p^m,p^n)/Z_n using the actual ineffective scalar subgroup, not all residue scalar matrices. It acts effectively on the arithmetic full-level moduli over Γ₀ subgroup level.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the lower-left congruence and the scalar determinant condition to define the matrix subgroups.
2. Identify the image of U_N by its kernel U_{p^n N}.
3. Form the two central quotients with the exact combined action relation.

**Prerequisites.** [H4/effective-level-groups](#h4-effective-level-groups), [H4/level-scalar-kernel](#h4-level-scalar-kernel), `mathlib:QuotientGroup.mk'`.

**API.**

- `TauCeti.HilbertModular.HilbertEffectiveGamma0` (constructor): The quotient PΓ₀=Γ₀/Z_n.
- `TauCeti.HilbertModular.effectiveLevel_mk` (projection): The normal-subgroup quotient projection.
- `TauCeti.HilbertModular.effectiveLevel_quotient` (universal-property): An action trivial on Z_n factors uniquely through PΓ₀.

**Unit tests.**

- `TauCeti.HilbertModular.effective_Q` (compatibility): For F=ℚ,N≥4, PΓ₀=Γ₀.
- `TauCeti.HilbertModular.effective_kernel` (characterisation): The projection kills exactly Z_n.
- `TauCeti.HilbertModular.effective_notPGL` (non-example): For F=ℚ and p odd the scalar −I₂ survives; this quotient is not PGL₂.

**Acceptance checks.**

- Γ₀ has an ineffective scalar subgroup on the arithmetic quotient, while the hybrid frame action is effective.

**Uses.**

- BHW8.18–8.19: State the finite étale torsors over subgroup level.
- O4 descent: Use an effective arithmetic finite-level group.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Definition 8.17 and§8.3.1, pp.1773–1775: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H4`; namespace `TauCeti.HilbertModular`.

**Planet.** Effective Hilbert level groups.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h4-level-scalar-kernel"></a>

### Ineffective scalar level subgroup

`HilbertModularVarietiesAndShimuraCurves:H4/level-scalar-kernel` · definition · `TauCeti.HilbertModular.hilbertLevelScalarKernel`

Let Z_n be the image of U_N under scalar reduction η↦ηI₂ in Γ₀(p^m,p^n). It is central and its kernel is U_{p^n N}, because p and N are coprime. Thus Z_n≅U_N/U_{p^n N}; the tame congruence is not dropped.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the lower-left congruence and the scalar determinant condition to define the matrix subgroups.
2. Identify the image of U_N by its kernel U_{p^n N}.
3. Form the two central quotients with the exact combined action relation.

**Prerequisites.** [H4/effective-level-groups](#h4-effective-level-groups), [H3/congruence-units](#h3-congruence-units).

**API.**

- `TauCeti.HilbertModular.hilbertLevelScalarKernel` (constructor): The central image Z_n of U_N in Γ₀.
- `TauCeti.HilbertModular.levelScalarKernel_mem` (characterisation): γ∈Z_n iff γ=ηI₂ for η∈U_N.
- `TauCeti.HilbertModular.levelScalarKernel_quotient` (equivalence): Z_n≅U_N/U_{p^n N}.

**Unit tests.**

- `TauCeti.HilbertModular.scalarKernel_Q` (computation): For F=ℚ,N≥4, Z_n={I₂}.
- `TauCeti.HilbertModular.scalarKernel_central` (compatibility): Every scalar image commutes with Γ₀.
- `TauCeti.HilbertModular.scalarKernel_tame` (non-example): A scalar global unit failing the N-congruence is not inserted into this image.

**Acceptance checks.**

- Γ₀ has an ineffective scalar subgroup on the arithmetic quotient, while the hybrid frame action is effective.

**Uses.**

- BHW8.18–8.19: State the finite étale torsors over subgroup level.
- O4 descent: Use an effective arithmetic finite-level group.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Definition 8.17 and§8.3.1, pp.1773–1775: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H4`; namespace `TauCeti.HilbertModular`.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h4-finite-level-torsors"></a>

### Finite-level torsors and diagonal exact sequences

`HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors` · theorem · `TauCeti.HilbertModular.finite_level_torsors`

In characteristic-zero with the stated fine tame level, X_Γ*→X_Γ₀* is a Γ₀* torsor, X_Γ→X_Γ₀* a Γ₀ torsor, and X_{G,Γ}→X_{G,Γ₀} a PΓ₀ torsor. The diagonal hybrid-to-arithmetic-subgroup map is an E torsor with exact sequences 1→Γ₀→E→Δ(N)→1 and 1→Δ(p^n N)→E→PΓ₀→1. No universal nonsplitting assertion is imposed on these extensions.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use finite étale frame moduli to prove the first two torsor diagrams.
2. Calculate the two central quotient kernels directly from the H4 square relation.
3. Obtain the arithmetic and diagonal torsor diagrams by the finite Cartesian quotient squares, using the already proved first sequences, so the proof is not circular.

**Prerequisites.** [H4/effective-level-groups](#h4-effective-level-groups), [H4/component-and-torsor-comparison](#h4-component-and-torsor-comparison), [H4/gamma0-cartesian](#h4-gamma0-cartesian), [H4/projective-level-group](#h4-projective-level-group), [H4/diagonal-level-group](#h4-diagonal-level-group).

**Acceptance checks.**

- For F=ℚ the extensions split, contrary to a blanket nonsplitting sentence in§8.3.1.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Proposition 8.18, diagram(8.6), Lemma 8.19, pp.1773–1775: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H4`; namespace `TauCeti.HilbertModular`.

**Planet.** Finite Hilbert torsors.

<a id="h4-connected-limit-finiteness"></a>

### Finite connected unit limit and stable images

`HilbertModularVarietiesAndShimuraCurves:H4/connected-limit-finiteness` · theorem · `TauCeti.HilbertModular.connected_limit_finiteness`

For everyp including 2, the finite groups Δ_n(N) have the uniform bound|Δ_n(N)|≤[U:U_N]·2^g. Their inverse limit Δ_∞(N) is finite. Let I_n be the image of Δ_∞→Δ_n; the surjective transition maps I_{n+1}→I_n are isomorphisms for n≫0, so Δ_∞≅I_n eventually. The literal assertion Δ_∞≅Δ_n via projection for all large n is false at p=2. The whole-space inverse limit lim Δ(p^n N) is a separate profinite group and is not covered by this bound.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Write B_n=U_{p^n}∩U_N and A_n=U_{p^n}∩U+. Bound[A_n:B_n²] by[A_n:A_n∩B_n]·[B_n:B_n²]≤[U:U_N]·2^g using the pinned unit structure.
2. If an inverse limit had more than that bound many distinct elements, a common finite level would separate them, contradicting the bound; thus the limit is finite.
3. The projections onto I_n have surjective transitions; their bounded nondecreasing cardinalities eventually stabilize, hence those transitions become isomorphisms. Do not replace I_n by Δ_n without an additional proof.

**Prerequisites.** [H4/connected-unit-groups](#h4-connected-unit-groups), [H3/delta-finiteness](#h3-delta-finiteness), `tauceti:NumberField.unitsMulEquivTorsionProdMultiplicative`.

**Acceptance checks.**

- The p=2,N=5 counterexample has|Δ_n|=6 and|Δ_∞|=3.
- S5/O4 must recheck any geometric quotient argument using the original stronger stabilization assertion.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Lemma 8.20, p.1775, corrected statement; source Issues E1–E2: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H4`; namespace `TauCeti.HilbertModular`.

**Planet.** Connected unit limit.

**Closure obligations.** Consumers of the corrected connected unit limit. See the closure ledger.

<a id="h4-stabilization-counterexamples"></a>

### Counterexamples to the printed unit stabilization proof

`HilbertModularVarietiesAndShimuraCurves:H4/stabilization-counterexamples` · application · `TauCeti.HilbertModular.stabilization_counterexamples`

For F=ℚ(√2),ε=1+√2: (i)p=3,N=4,η=ε⁴=17+12√2 lies in U_4 and η≡−1 modulo 3, so η² defines a nonzero class in Δ₁(4) which is zero in Δ(4); neither root±η lies in U_12. (ii)p=2,N=5 andn≥2, U_{2^n}=⟨ε^{2^n}⟩ and U_{2^n 5}=⟨ε^{3·2^n}⟩, hence Δ_n(5)≅ℤ/6 with transition multiplication by 2. Its inverse limit is ℤ/3; the original maps never stabilize to isomorphisms.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. For(i), compute η mod 4 and 3 and use that the only field square roots of η² are±η.
2. For(ii), verify O×={±ε^k} by reducing a positive unit to the interval[1,ε) and using the Pell norm equation. Recurrence forε^{2^m}=a_m+b_m√2 givesv₂(b_m)=m; negative signs fail mod 4.
3. Compute the order ofε mod 5 as 12. Combine the congruence orders and positive-unit condition, obtaining the cyclic quotients and multiplication-by 2 transitions.
4. The 2-primary factor dies in the inverse limit and the 3-primary factor survives.

**Prerequisites.** [H4/connected-unit-groups](#h4-connected-unit-groups), [H3/tame-delta](#h3-tame-delta).

**Acceptance checks.**

- η²=577+408√2 has norm 1 and is totally positive.
- Multiplication by 2 on ℤ/6 is not injective or surjective.
- These calculations invalidate the printed proof even at an oddp, and the full eventual projection assertion at p=2.

**Source contracts.**

- [H0/BHW23](#h0-bhw23), Lemma 8.20 proof, p.1775; explicit countercalculation: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H4`; namespace `TauCeti.HilbertModular`.

<a id="h5"></a>

## H5. Classical geometry and comparison tests

Require the rational modular comparison at every level, with the μ_N-to-point isogeny convention and cyclotomic component fields retained. Real quadratic minimal cusps have codimension two; they are not product boundary divisors. Split the Hodge bundle over a characteristic-zero coefficient field and descend the unsplit object before imposing algebraic weight conditions.

<a id="h5-rational-modular-comparison"></a>

### Rational modular-curve comparison

`HilbertModularVarietiesAndShimuraCurves:H5/rational-modular-comparison` · comparison · `TauCeti.HilbertModular.rational_modular_comparison`

For F=ℚ both imported Hilbert groups are GL₂, d=ℤ, and a c-polarization becomes the elliptic principal polarization after the positive generator ofc is fixed. Match μ_N⊂E[N] to the marked-point Y₁(N) convention by quotienting E by its μ_N image and using the Cartier-dual kernel of the dual isogeny; match full and Γ₀ levels through the explicit dual/polarization maps. Then all three full-level spaces and their quotients agree with V8/R12.2 modular curves, with compatible level and Hecke maps. A fixed-root full pairing component has its actual cyclotomic field.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the imported rational group equalities and identify the c lattice by its chosen positive generator.
2. Construct the μ_N-to-point comparison by A3 quotient/Cartier duality, checking the marked e₁ versus e₂ convention rather than dropping it.
3. Compare every p-level forgetful/isogeny map with V8 and R12.2; retain the field of a selected root component.

**Prerequisites.** [H0/domain-comparison](#h0-domain-comparison), [H1/tame-level-functors](#h1-tame-level-functors), [H4/arithmetic-full-level](#h4-arithmetic-full-level), [H4/integral-gamma0](#h4-integral-gamma0), `ShimuraVarieties:V8/gl2-gamma1`, `ShimuraVarieties:V8/gl2-gamma0`, `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/gl2-tower-compatibility`, `ModularCurvesPartII:R12.2`.

**Acceptance checks.**

- Δ(N),Δ_n(N),Z_n are trivial for F=ℚ,N≥4.
- The comparison works over ℤ[1/N] in the appropriate finite-flat category, with fullp-level only generically.

**Source contracts.**

- [H0/ROADMAP](#h0-roadmap), H5, first paragraph: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H5`; namespace `TauCeti.HilbertModular`.

<a id="h5-quadratic-domain-boundary"></a>

### Real quadratic domains and minimal cusps

`HilbertModularVarietiesAndShimuraCurves:H5/quadratic-domain-boundary` · theorem · `TauCeti.HilbertModular.quadratic_domain_boundary`

For real quadratic F the Hilbert domains have complex dimension 2, with 4 independent-sign G components and 2 common-sign G* components. Under C6’s stated tame-ideal hypotheses, its rational minimal boundary consists of finite zero-dimensional cusps on a chosen finite-level quotient, of codimension 2. This is not the boundary of a product of two compactified modular curves, whose divisor components are one-dimensional. Toroidal boundary divisors are a separate compactification.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
- For the C6 minimal-boundary comparison retain its tame-ideal range: n is coprime to the field discriminant and does not divide 2 or 3, and c is prime to n; use the supplier’s actual torsion-free moduli input. Other levels require a separate canonical finite-level comparison.

**Proof route.**

1. Specialize H0 to two real embeddings.
2. Apply C6’s actual Hilbert minimal-cusp classification, not a product compactification.
3. Compare dimensions of the minimal cusp boundary and of a product’s boundary divisors.

**Prerequisites.** [H0/domain-comparison](#h0-domain-comparison), `ShimuraCompactifications:C6/hilbert-minimal-cusps`.

**Acceptance checks.**

- Minimal cusps and toroidal exceptional curves are not identified.

**Source contracts.**

- [H0/ROADMAP](#h0-roadmap), H5, quadratic comparison: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H5`; namespace `TauCeti.HilbertModular`.

**Planet.** Hilbert minimal cusps.

<a id="h5-hodge-splitting-descent"></a>

### Hilbert Hodge splitting and descent

`HilbertModularVarietiesAndShimuraCurves:H5/hodge-splitting-descent` · comparison · `TauCeti.HilbertModular.hodge_splitting_descent`

In characteristic-zero,ω_A is a rank-one O⊗𝒪 module. After extending coefficients to a field L containing all embeddings F→L, it decomposes canonically as⊕_τω_τ via the idempotents of F⊗L, with each ω_τ a line. The original unsplit O⊗𝒪 bundle and its descent datum recover ω_A; automorphic line construction and central descent agree with B4 and C6 on their stated loci. At a ramified integral prime there is no corresponding family of orthogonal embedding idempotents without extra structure.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use rank-one freeness on the generic fibre and split the coefficient algebra F⊗L.
2. Identify the embedding components with B4’s actual weight-bundle construction.
3. Use the imported descent before splitting; contrast this with non-étale O⊗k at a ramified prime.

**Prerequisites.** [H2/rapoport-locus](#h2-rapoport-locus), `AutomorphicBundles:B4/unsplit-hilbert-descent`, `ShimuraCompactifications:C6/hilbert-conormal-comparison`.

**Acceptance checks.**

- For F=ℚ the decomposition has one summand.
- For F=ℚ(√2),p=2, O⊗𝔽₂≅𝔽₂[T]/T² and the integral splitting assertion fails.

**Source contracts.**

- [H0/ROADMAP](#h0-roadmap), H5, Hodge bundle paragraph: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H5`; namespace `TauCeti.HilbertModular`.

<a id="h5-algebraic-weights-units"></a>

### Algebraic Hilbert weights and central units

`HilbertModularVarietiesAndShimuraCurves:H5/algebraic-weights-units` · theorem · `TauCeti.HilbertModular.algebraic_weights_units`

For a coefficient field splitting F, an algebraic weight is(k_τ,w) withk_τ≡w modulo 2; putm_τ=(w−k_τ)/2. The tensor product of embedding Hodge/determinant factors is the B4 Hilbert arithmetic weight bundle, descended through the actual central kernel. Its scalar coefficient character is Norm_{F/ℚ}(t)^w in B4’s convention; totally positive units have norm 1, and any remaining sign character must be checked on the finite residual stabilizer. Nonalgebraic p-adic weights and integral ramified splitting are outside this assertion.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Apply B4’s precise parity and determinant-exponent convention.
2. Check the action of each central scalar on the descended coefficient line, not just on the domain.
3. Use positivity and Norm(η)=1 for positive units; check finite signs rather than declaring every central action trivial.

**Prerequisites.** [H5/hodge-splitting-descent](#h5-hodge-splitting-descent), [H3/arithmetic-quotient](#h3-arithmetic-quotient), `AutomorphicBundles:B4/hilbert-arithmetic-weight`, `AutomorphicBundles:B4/hilbert-central-descent`.

**Acceptance checks.**

- If somek_τ−w is odd, an integral algebraic determinant exponent is unavailable.
- A nontrivial sign character prevents descent through that stabilizer.

**Source contracts.**

- [H0/ROADMAP](#h0-roadmap), H5, weight and central-unit comparison: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H5`; namespace `TauCeti.HilbertModular`.

**Planet.** Algebraic Hilbert weights.

<a id="h5-nonprincipal-ramified-test"></a>

### Nonprincipal and ramified comparison example

`HilbertModularVarietiesAndShimuraCurves:H5/nonprincipal-ramified-test` · application · `TauCeti.HilbertModular.nonprincipal_ramified_test`

Take F=ℚ(√10),O=ℤ[√10],c=(2,√10),N=7,p=5. The idealc has norm 2 and is not principal: a generator would have norm±2, impossible modulo 5. The primep ramifies since disc(F)=40, whilec and N are prime to p. Construct L_c and its dualc L_c, the DP model and its Rapoport/ordinary locus with this label. Over a splitting field ω has two lines; over the ramified residue base this splitting is not imposed.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Compute O,disc(F), the quotient O/c and the norm-form congruencea²−10b²=±2.
2. Apply H0’s trace-dual formula with the genuine nonprincipal ideal.
3. Apply the arbitrary-prime H2 model with 5∤7 and verify that it does not assert global smoothness or integral embedding splitting.

**Prerequisites.** [H0/lattice-duality](#h0-lattice-duality), [H2/polarization-representatives-at-p](#h2-polarization-representatives-at-p), [H2/ordinary-rapoport](#h2-ordinary-rapoport), [H5/hodge-splitting-descent](#h5-hodge-splitting-descent).

**Acceptance checks.**

- The ideal’s nonprincipality andp ramification are checked independently.
- The example does not claim every fibre is ordinary.

**Source contracts.**

- [H0/ROADMAP](#h0-roadmap), H5, final sentence: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H5`; namespace `TauCeti.HilbertModular`.

<a id="h6"></a>

## H6. Twisted torsion moduli and arithmetic points

The twist is the descent of an actual paired finite Isom-torsor, possibly with noncommutative structure group. Select a component and compute its field of definition before asking for real or finite local points. Local nonemptiness is a construction with exact residual types, not a consequence of Moret–Bailly. In Allen’s CM elliptic case the dual second module fixes the determinant and restriction of scalars makes X_i two-dimensional.

<a id="h6-torsion-isom-torsor"></a>

### Simultaneous torsion Isom torsor

`HilbertModularVarietiesAndShimuraCurves:H6/torsion-isom-torsor` · definition · `TauCeti.HilbertModular.HilbertTorsionIsomTorsor`

Let K be a characteristic-zero field and ℓ₁≠ℓ₂ distinct odd primes, with full paired torsion markings at these primes. A retained extra tame marking is prime to ℓ₁ℓ₂; in the elliptic specialization the two full odd torsion levels themselves supply a fine marking. Fori=1,2 let V_i be a finite étale G_K-module locally free of rank 2 over O/ℓ_i O, equipped with a perfect alternating pairing∧²V_i≅(c d⁻¹/ℓ_ic d⁻¹)⊗μ_{ℓ_i}. Define the symplectic O-linear Isom torsor from the standard torsion module with its matching pairing to V_i, and take their product. Its finite structural group is the product of the two symplectic automorphism groups; it need not be commutative.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Construct the finite étale sheaf of actual pairing-preserving O-module isomorphisms.
2. Use the given determinant/pairing identity to ensure the torsor exists locally and identify its structural group.
3. Keep the product cocycle and its pairing target, rather than only the abstract representation dimensions.

**Prerequisites.** [H1/linear-weil-pairing](#h1-linear-weil-pairing), [H4/pairing-multiplier](#h4-pairing-multiplier), `AlgebraicModuliForArithmeticGeometry:R09.3`.

**API.**

- `TauCeti.HilbertModular.HilbertTorsionIsomTorsor` (constructor): The product of the actual finite pairing-preserving Isom torsors.
- `TauCeti.HilbertModular.torsionIsomTorsor_points` (characterisation): Sections are precisely the two O-linear symplectic identifications.
- `TauCeti.HilbertModular.torsionIsomTorsor_baseChange` (functoriality): The torsor pulls back with V_i and their actual pairing targets.
- `TauCeti.HilbertModular.torsionIsomTorsor_cocycle` (compatibility): A splitting-field frame gives the cocycleσ↦frame⁻¹σ(frame), and changing the frame gives a cohomologous cocycle.
- `TauCeti.HilbertModular.torsionIsomTorsor_ext` (extensionality): Two sections of the simultaneous Isom torsor agree if both underlying O/ℓ_i O-linear maps agree; pairing-preservation proofs add no extra data.

**Unit tests.**

- `TauCeti.HilbertModular.torsionTorsor_trivial` (degenerate): For the standard paired modules with fixed frames, the torsor has a rational section and the twist is untwisted.
- `TauCeti.HilbertModular.torsionTorsor_determinant` (non-example): A two-dimensional representation whose determinant is not the required cyclotomic pairing character has no equivariant paired Isom section.
- `TauCeti.HilbertModular.torsionTorsor_coboundary` (compatibility): Changing both splitting frames by group elements leaves the descended twist canonically isomorphic.

**Acceptance checks.**

- A determinant-incompatible module is not an allowed input.

**Uses.**

- Taylor simultaneous levels: Twist the fine Hilbert moduli by the residual Galois modules.
- Allen§7.2.5: Specialize to paired elliptic ℓ₁/ℓ₂ modules.

**Source contracts.**

- [H0/TAYLOR02](#h0-taylor02), §1, p.13, simultaneous torsion moduli: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H6`; namespace `TauCeti.HilbertModular`.

**Planet.** Torsion Isom torsor.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h6-simultaneous-torsion-twist"></a>

### Twisted Hilbert torsion moduli

`HilbertModularVarietiesAndShimuraCurves:H6/simultaneous-torsion-twist` · construction · `TauCeti.HilbertModular.TwistedHilbertTorsionModuli`

Twist the fine paired full ℓ₁/ℓ₂ Hilbert moduli and its universal HBAV by the inverse action of the actual Hilbert Torsion Isom Torsor. The descended K-space classifies (A,ι,λ,μ_N,α₁,α₂) when the Hilbert tame marking is retained, and (A,ι,λ,α₁,α₂) when full torsion level itself supplies the fine marking. In both cases α_i:V_i≅A∨[ℓ_i] preserves the c d⁻¹-valued pairing. Over a splitting field it is isomorphic to the untwisted paired full-level space. This construction uses effective finite noncommutative descent, not the commutative Γ-only torsor-twist node of R09.4.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Construct the characteristic-zero fine full torsion moduli using M1/M2 and its actual complex component from M3. For the retained Hilbert μ_N convention compare with H4; for Allen’s elliptic specialization use the two full odd torsion levels as the fine marking, without an independent μ_N datum. Form the contracted product with the inverse/right-versus-left action.
2. Descend the scheme and its universal family from the splitting-field fine cover using R09.3.
3. Verify the moduli universal property by twisting the paired frames in both directions.

**Prerequisites.** [H6/torsion-isom-torsor](#h6-torsion-isom-torsor), [H4/hybrid-full-level](#h4-hybrid-full-level), [H4/geometric-full-level](#h4-geometric-full-level), `AlgebraicModuliForArithmeticGeometry:R09.3`, `mathlib:AlgebraicGeometry.Scheme`, `PELModuli:M1/char-zero-adelic-moduli`, `PELModuli:M2/representability`, `PELModuli:M3/algebraization-of-components`.

**API.**

- `TauCeti.HilbertModular.TwistedHilbertTorsionModuli` (constructor): The descended simultaneous paired torsion moduli space.
- `TauCeti.HilbertModular.twistedHilbertModuli_points` (universal-property): T-points correspond to the stipulated HBAV and pairedα_i data.
- `TauCeti.HilbertModular.twistedHilbertModuli_split` (equivalence): A splitting field and chosen paired frames identify the twist with the untwisted full-level moduli.
- `TauCeti.HilbertModular.twistedHilbertModuli_universal` (data): The fine universal HBAV descends through the verified cocycle and pulls back to the untwisted family.

**Unit tests.**

- `TauCeti.HilbertModular.twist_trivial` (compatibility): The trivial framed torsor yields the original fine moduli and family.
- `TauCeti.HilbertModular.twist_pairing` (non-example): An unpaired abstract GL₂ torsor can mix Weil-pairing components and is not accepted as this twist.
- `TauCeti.HilbertModular.twist_frame_change` (compatibility): A cohomologous frame cocycle yields an isomorphism preserving the universal moduli interpretation.

**Acceptance checks.**

- No global rational frame for V_i is assumed.

**Uses.**

- Potential Modularity And Compatible Systems R23.1–R23.2: Supply the actual twisted fine arithmetic variety.
- H6 local points: Turn explicit paired local HBAVs into local points.

**Source contracts.**

- [H0/TAYLOR02](#h0-taylor02), §1, p.13, moduli quintuple and smoothness: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H6`; namespace `TauCeti.HilbertModular`.

**Planet.** Twisted Hilbert torsion moduli.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h6-twisted-component-descent"></a>

### Selected component descent and irreducibility

`HilbertModularVarietiesAndShimuraCurves:H6/twisted-component-descent` · theorem · `TauCeti.HilbertModular.twisted_component_descent`

Choose a geometric paired-multiplier and narrow-class component of the twisted full-level space. It descends over its finite field of definition K_C, or over K if its component label is G_K-fixed. The descended component is smooth of dimension g and geometrically irreducible; it is quasi-projective after applying the characteristic-zero PEL ample/compactification supplier and the finite descent of an ample bundle. The fine universal HBAV restricts to it. No component is declared G_K-fixed solely from a chosen splitting-field point.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the exact multiplier/component labels and their Galois action to compute the stabilizer field.
2. Use the complex quotient by the connected symmetric domain and DP’s normal connected-fibre result to obtain geometric irreducibility of the chosen component.
3. Descend smoothness and the fine universal family; obtain quasi-projectivity through the actual ample-line supplier and norm/descent along K_C.

**Prerequisites.** [H6/simultaneous-torsion-twist](#h6-simultaneous-torsion-twist), [H4/component-and-torsor-comparison](#h4-component-and-torsor-comparison), [H1/complex-hilbert-comparison](#h1-complex-hilbert-comparison), `ShimuraCompactifications:C5/open-quasiprojectivity`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

**Acceptance checks.**

- The dimension isg; in the elliptic specialization it is 1.
- A noninvariant component is exported over K_C, not silently over K.

**Source contracts.**

- [H0/DP94](#h0-dp94), Corollary 2.4, p.64; Taylor§1, p.13: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.
- [H0/TAYLOR02](#h0-taylor02), §1, p.13, fine simultaneous torsion moduli and complex connectedness: Taylor gives the complex connected-domain argument for the chosen paired torsion component. DP Corollary 2.4 alone does not construct the twist or its component descent.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H6`; namespace `TauCeti.HilbertModular`.

**Planet.** Twisted component descent.

<a id="h6-real-torsion-points"></a>

### Real torsion points with polarization signature

`HilbertModularVarietiesAndShimuraCurves:H6/real-torsion-points` · theorem · `TauCeti.HilbertModular.real_torsion_points`

At a real place of K_C, require the prescribed V_i to have the polarization-compatible odd involution: in a real split O/ℓ_i frame, complex conjugation has one+ and one− eigendirection and reverses the cyclotomic pairing. If the chosen component’s real signature is compatible, the real HBAV obtained from the ordered trace-polarized real analytic lattice gives paired torsion identifications and a real point on that component. The real local locus is a nonempty open around it. Even residual modules or a mismatched component are not covered.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the ordered module and trace sign to construct the real polarized complex torus with its real involution.
2. Apply A5 algebraicity and compute the torsion conjugation eigenspaces and alternating pairing.
3. Match the prescribed paired frames and the selected component label; use smoothness for the real open.

**Prerequisites.** [H6/twisted-component-descent](#h6-twisted-component-descent), [H0/integral-trace-family](#h0-integral-trace-family), [H1/ordered-polarization-module](#h1-ordered-polarization-module), `AbelianSchemesAndArithmeticModuli:A5`.

**Acceptance checks.**

- For F=ℚ the real elliptic torsion involution has eigenvalues+1 and−1 at odd ℓ.
- Determinant+1 on complex conjugation fails the required cyclotomic oddness.

**Source contracts.**

- [H0/TAYLOR02](#h0-taylor02), Lemma 1.4, p.12, real HBAV construction: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H6`; namespace `TauCeti.HilbertModular`.

<a id="h6-hilbert-finite-local-points"></a>

### Finite local Hilbert torsion points

`HilbertModularVarietiesAndShimuraCurves:H6/hilbert-finite-local-points` · theorem · `TauCeti.HilbertModular.hilbert_finite_local_points`

For a finite placev of K_C, local nonemptiness is asserted only for explicitly constructed paired HBAVs in the selected component. Under Taylor§1’s ordinary-extension/CM-character hypotheses, construct them by the trace-polarized Tate lattice in the multiplicative case, or by the ordinary Honda–Tate HBAV followed by O-linear Serre–Tate lifting in the finite H_f extension class. At the second auxiliary characteristic use the separately specified ordinary construction. Matching both auxiliary torsion modules, pairing multipliers and component labels is part of the conclusion; arbitrary local Galois modules are not claimed realizable.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. For the multiplicative case choose the lattice parameter in the stated Kummer class and adjust its valuation by an auxiliary-divisible positive element to ensure trace polarization.
2. For the ordinary case import Honda–Tate, construct the O-action and ordered polarization class, then lift the exact finite extension class by Serre–Tate with its endomorphism/polarization constraints.
3. Check the two paired torsion identifications and the component label, then take the specified nonempty smooth local open. The exact Taylor input data and Honda–Tate supplier are recorded as prerequisites/gaps, not an unconditional realization theorem.

**Prerequisites.** [H6/twisted-component-descent](#h6-twisted-component-descent), [H6/torsion-isom-torsor](#h6-torsion-isom-torsor), `AbelianSchemesAndArithmeticModuli:A4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`, `AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate`, `AbelianSchemesAndArithmeticModuliPartII:F3`.

**Acceptance checks.**

- A residual extension outside the finite H_f condition is not declared to have an ordinary good-reduction lift.
- Local opens carry their place, extension field and component label.

**Source contracts.**

- [H0/TAYLOR02](#h0-taylor02), Lemmas 1.2–1.3, pp.9–12: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H6`; namespace `TauCeti.HilbertModular`.

**Closure obligations.** Taylor local input and structured Honda–Tate realization. See the closure ledger.

<a id="h6-allen-elliptic-twists"></a>

### Allen elliptic twists and Weil restriction

`HilbertModularVarietiesAndShimuraCurves:H6/allen-elliptic-twists` · construction · `TauCeti.HilbertModular.AllenEllipticTwist`

Under Allen Assumption 7.2.6 (ℓ₂ splitting in the coefficient fields; the two residual images containing SL₂; ℓ₁,ℓ₂ unramified in F, outside each S_i, of good reduction for E, and >2m_i+3), put K=FF₁⁺ and fix r_i′ with determinant ε_{ℓ₂}^{−1}. Define Y_i/K to classify elliptic D with symplectic α₁:E[ℓ₁]≅D[ℓ₁] and α₂:V_{r_i′}∨≅D[ℓ₂]. This is the paired elliptic specialization of the simultaneous Isom-torsor twist; its selected geometric component is a smooth geometrically irreducible curve. The second residual module is dualized so its pairing has cyclotomic multiplier.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Specialize the paired simultaneous torsion twist to F=Q. Dualize V_{r_i′} so its determinant and alternating pairing have cyclotomic multiplier, and use the stipulated symplectic identifications.
2. Use the fine full-level elliptic moduli at the two distinct odd auxiliary primes, and the selected fixed-pairing component. Over a splitting field this component is the connected modular curve, hence is smooth, geometrically irreducible and one-dimensional. No independent μ_N marking is stored in Y_i; the two full odd torsion identifications already eliminate elliptic automorphisms.
3. Apply the finite noncommutative descent already requested for the twist and the component. Weil restriction is the separate allen-restriction-moduli node, not part of this construction.

**Prerequisites.** [H6/simultaneous-torsion-twist](#h6-simultaneous-torsion-twist), [H6/twisted-component-descent](#h6-twisted-component-descent), [H5/rational-modular-comparison](#h5-rational-modular-comparison), `mathlib:AlgebraicGeometry.Scheme`.

**API.**

- `TauCeti.HilbertModular.AllenEllipticTwist` (constructor): The symplectic elliptic moduli Y_i.
- `TauCeti.HilbertModular.allenElliptic_points` (universal-property): Points are D with the two stipulated paired torsion isomorphisms.
- `TauCeti.HilbertModular.allenElliptic_split` (equivalence): Over a splitting field it is the compatible Weil-multiplier component of the full elliptic level moduli.

**Unit tests.**

- `TauCeti.HilbertModular.allen_dual` (non-example): The undualized second module has inverse cyclotomic determinant and generally fails the pairing condition.
- `TauCeti.HilbertModular.allenElliptic_dimension` (computation): Y_i has dimension 1.
- `TauCeti.HilbertModular.allenElliptic_trivial` (compatibility): When both paired modules are torsion of one elliptic curve, that curve with identity maps gives a point.

**Acceptance checks.**

- X_i is not an elliptic moduli curve when[K:k]=2.

**Uses.**

- Allen proof of Theorem 7.1.11: Supply the actual Y_i/X_i variety for the Moret–Bailly application.
- Potential Modularity And Compatible Systems R23.1: Export its dimension, real loci and finite local opens.

**Source contracts.**

- [H0/ALLEN23](#h0-allen23), §7.2.5, published pp.1103–1106: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H6`; namespace `TauCeti.HilbertModular`.

**Planet.** Allen elliptic torsion twists.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h6-allen-restriction-moduli"></a>

### Allen restriction of torsion moduli

`HilbertModularVarietiesAndShimuraCurves:H6/allen-restriction-moduli` · construction · `TauCeti.HilbertModular.AllenRestrictionModuli`

For K=FF₁⁺, k=F⁺F₁⁺ in Allen §7.2.5, define X_i=Res_{K/k}Y_i using A6’s quasi-projective finite-separable restriction of scalars. It is smooth and geometrically irreducible of dimension [K:k]=2. The universal family on Y_i gives an abelian-family restriction comparison over X_i. At a real place, X_i(ℝ)=Y_i(ℂ), so this CM case requires no real odd involution.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Specialize the actual paired torsion twist to F=ℚ and use V_{r_i′}∨ so its determinant isε_{ℓ₂}.
2. Use A6 finite-separable Weil restriction of the quasi-projective scheme Y_i.
3. Use the splitting-product comparison to compute smoothness, dimension and geometric irreducibility; do not repeat the generic Weil-restriction theorem.

**Prerequisites.** [H6/allen-elliptic-twists](#h6-allen-elliptic-twists), `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`, `AbelianSchemesAndArithmeticModuli:A6/finite-etale-weil-restriction-of-abelian-schemes`, `mathlib:AlgebraicGeometry.Scheme`.

**API.**

- `TauCeti.HilbertModular.AllenRestrictionModuli` (constructor): X_i=Res_{K/k}Y_i.
- `TauCeti.HilbertModular.allenTwist_points` (characterisation): X_i(L)=Y_i(K⊗_k L).
- `TauCeti.HilbertModular.allenTwist_split` (compatibility): Its geometric base change is the product of the conjugate Y_i.
- `TauCeti.HilbertModular.allenRestriction_family` (data): The finite-étale A6 restriction of the pulled-back elliptic family has relative dimension [K:k].

**Unit tests.**

- `TauCeti.HilbertModular.allen_dimension` (computation): For the quadratic CM extension, X_i has dimension 2.
- `TauCeti.HilbertModular.allen_real` (compatibility): For a real place of k, K⊗_k ℝ≅ℂ and X_i(ℝ)=Y_i(ℂ).
- `TauCeti.HilbertModular.allen_restriction_split` (compatibility): For K=k the restriction is Y_i itself.

**Acceptance checks.**

- X_i is not an elliptic moduli curve when[K:k]=2.

**Uses.**

- Allen proof of Theorem 7.1.11: Supply the actual Y_i/X_i variety for the Moret–Bailly application.
- Potential Modularity And Compatible Systems R23.1: Export its dimension, real loci and finite local opens.

**Source contracts.**

- [H0/ALLEN23](#h0-allen23), §7.2.5, published pp.1103–1106: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H6`; namespace `TauCeti.HilbertModular`.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="h6-allen-finite-local-points"></a>

### Allen finite local elliptic points

`HilbertModularVarietiesAndShimuraCurves:H6/allen-finite-local-points` · theorem · `TauCeti.HilbertModular.allen_finite_local_points`

Retain Allen’s auxiliary-prime and local finite-flat hypotheses. Above L₀∪{ℓ₁}, use E after a finite unramified extension whose Frobenius powers match the two paired residual modules. Above ℓ₂, when the residual dual is the prescribed supersingular finite-flat type or a peu-ramifié ordinary extension, construct a good-reduction D after a finite unramified extension and pair both torsion identifications. In the ordinary case lift the negative residual extension class using Lemma 7.2.2 and Serre–Tate. For supersingular D descended from𝔽_{ℓ₂}, Frobenius overk(w) uses its residue degree: its squared scalar is(−ℓ₂)^{[k(w):𝔽_{ℓ₂}]}, not universally−ℓ₂.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. At places away from ℓ₂ choose a common finite unramified extension killing the finite Frobenius discrepancies while preserving the pairing determinant.
2. In the supersingular case choose the compatible finite-flat local type and compute the Frobenius scalar with the actual residue degree; enlarge the unramified degree until the prime-to-ℓ₂ torsion matches.
3. In the ordinary case choose an ordinary reduction and kill its finite residual unramified characters; use the H_f lift surjectivity and the negative class to obtain the dual residual extension.
4. Check the component/pairing and good reduction at every place; request the precise local finite-flat classification and Serre–Tate input rather than assuming every residual module is realized.

**Prerequisites.** [H6/allen-elliptic-twists](#h6-allen-elliptic-twists), `AbelianSchemesAndArithmeticModuli:A4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`, [H6/allen-restriction-moduli](#h6-allen-restriction-moduli).

**Acceptance checks.**

- An arbitrary non-finite-flat residual module is excluded.
- The ordinary residual extension lives over𝔽_{ℓ₂}, not the unrelated residue fieldk(w).
- The Frobenius check includes residue degree greater than 1.

**Source contracts.**

- [H0/ALLEN23](#h0-allen23), §7.2.5, published pp.1104–1105; Lemma 7.2.2, published pp.1098–1099: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H6`; namespace `TauCeti.HilbertModular`.

**Closure obligations.** Allen supersingular and ordinary local pairing checks. See the closure ledger.

<a id="h6-moret-bailly-input-export"></a>

### Geometric and local input export

`HilbertModularVarietiesAndShimuraCurves:H6/moret-bailly-input-export` · application · `TauCeti.HilbertModular.moret_bailly_input_export`

Export to R23.1–R23.2 the selected smooth geometrically irreducible quasi-projective K_C-scheme, its dimension, field of definition, fine universal family and all constructed nonempty real/finite local opens with their exact local extension and reduction conditions. In the Allen case export X_i overk and the corresponding Weil-restriction family, with dimension[K:k]. Moret–Bailly is a downstream theorem consuming these witnesses; it is not a prerequisite proving their existence.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Assemble the verified component and local constructions into one typed export with all fields and opens.
2. Check every local open refers to that component and base field, not a point on an unrelated split component.
3. Pass the bundle of inputs to the potential-modularity owner; no edge returns from its modularity theorem.

**Prerequisites.** [H6/real-torsion-points](#h6-real-torsion-points), [H6/hilbert-finite-local-points](#h6-hilbert-finite-local-points), [H6/allen-finite-local-points](#h6-allen-finite-local-points), [H6/allen-restriction-moduli](#h6-allen-restriction-moduli).

**Acceptance checks.**

- The export records unresolved supplier/source-proof leaves before an implementation ticket is ready.

**Source contracts.**

- [H0/ALLEN23](#h0-allen23), §7.2.5, published pp.1103–1106: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/H6`; namespace `TauCeti.HilbertModular`.

**Closure obligations.** Taylor local input and structured Honda–Tate realization; Allen supersingular and ordinary local pairing checks. See the closure ledger.

<a id="r18.1"></a>

## R18.1. Hilbert–Blumenthal and quaternionic moduli

One specified split real embedding gives the quaternionic curve domain H^±, dimension one and reflex field τ(F). The exact B× datum need not have a PEL interpretation. Yuan–Zhang’s G′/G″ bridge supplies an auxiliary PEL curve over its weighted CM reflex field F′⊇τ(F). Connected finite-level comparisons retain their prime-to-discriminant condition and field-of-definition obligation.

<a id="r18.1-quaternionic-datum"></a>

### One-real-split quaternionic datum

`HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-datum` · construction · `TauCeti.HilbertModular.QuaternionicShimuraDatum`

Given a quaternion F-algebra B split at the specified real embedding τ and ramified at all other real embeddings, form G_B=Res_{F/ℚ}B× on the existing quaternion and restriction-of-scalars carriers. Set h_B(z)=([[x,y],[−y,x]]⁻¹,1,…,1) forz=x+iy under B_τ≅M₂(ℝ). Its full conjugacy class is H^±. Verify D4’s SV1–SV3; its real central weight need not be ℚ-rational when[F:ℚ]>1, which D4 treats as a separate predicate. A totally definite B yields a finite class set in R18.3 instead.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the existing quaternion conjugation/norm and restriction-of-scalars group, with the chosen real splitting.
2. Compute the three adjoint Hodge types at τ and type(0,0) at compact real factors.
3. At τ the induced involution is Cartan on PGL₂; at the other factors the identity is Cartan because they are compact. The rational adjoint group is ℚ-simple andh is nontrivial on it.

**Prerequisites.** `ShimuraData:D4/shimura-datum`, `ShimuraData:D2/cartan-adjoint-criterion`, `ReductiveGroupsPartII:RG2.0a`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`, `mathlib:AlgebraicGeometry.Scheme`.

**API.**

- `TauCeti.HilbertModular.QuaternionicShimuraDatum` (constructor): The D4 datum with one specified real split factor and the displayedh.
- `TauCeti.HilbertModular.quaternionicDatum_domain` (data): Its conjugacy domain is H^± and its connected domain is H.
- `TauCeti.HilbertModular.quaternionicDatum_splittingChange` (equivalence): Changing the real matrix splitting conjugatesh and yields the same datum class.
- `TauCeti.HilbertModular.quaternionicDatum_adjoint` (compatibility): The adjoint real group is PGL₂(ℝ) times compact quaternionic projective groups.

**Unit tests.**

- `TauCeti.HilbertModular.quaternion_Q_split` (compatibility): For B=M₂(ℚ), the complex domain is the modular H^± domain.
- `TauCeti.HilbertModular.quaternion_definite` (non-example): A totally definite algebra with no chosen split real place does not produce this curve datum.
- `TauCeti.HilbertModular.quaternion_dimension` (computation): For degreeg>1 with exactly one real split factor the domain is still one-dimensional.

**Acceptance checks.**

- For F=ℚ,B=M₂(ℚ), recover the inverse homological GL₂ datum.
- The full central weight is not falsely declared rational for a single active embedding.

**Uses.**

- V8 specialization: Construct the canonical quaternionic curve.
- YZ§§3–5: Compare its connected geometry with the PEL bridge.

**Source contracts.**

- [H0/YZ18](#h0-yz18), §4.1, p.561, displayedh and uniformization: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/R181`; namespace `TauCeti.HilbertModular`.

**Planet.** Quaternionic Shimura datum.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="r18.1-quaternionic-reflex-dimension"></a>

### Quaternionic reflex field and dimension

`HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-reflex-dimension` · theorem · `TauCeti.HilbertModular.quaternionic_reflex_dimension`

For the one-real-split quaternionic datum, the reflex field is τ(F)⊂ℂ and the Shimura variety has complex dimension 1. The cocharacter type is nontrivial only at τ, so its Galois stabilizer fixes that embedding. This differs from the Hilbert datum’s reflex field ℚ and from the auxiliary PEL bridge field F′, which generally only contains τ(F).

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Compute the geometric cocharacter class factor by factor, using its unique active real embedding.
2. Apply the imported reflex-stabilizer definition to identify τ(F).
3. Use the H^± domain identification for dimension 1.

**Prerequisites.** [R18.1/quaternionic-datum](#r18.1-quaternionic-datum), `ShimuraData:D3/cocharacter-class`, `ShimuraData:D3/reflex-field`.

**Acceptance checks.**

- For F=ℚ the reflex field is ℚ.
- A Hilbert group comparison cannot be used to set this reflex field to ℚ forg>1.

**Source contracts.**

- [H0/YZ18](#h0-yz18), §4.1, p.561, canonical curves over F; compare Proposition 3.1, p.551: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/R181`; namespace `TauCeti.HilbertModular`.

**Planet.** Quaternionic reflex field.

<a id="r18.1-canonical-quaternionic-curve"></a>

### Canonical quaternionic curve and uniformization

`HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve` · construction · `TauCeti.HilbertModular.QuaternionicShimuraCurve`

For compact open U⊂G_B(A_f), apply the general canonical-model theory at the datum’s reflex field τ(F), obtaining Sh_U(G_B,X_B). Its complex points are G_B(ℚ)\(H^±×G_B(A_f)/U). Level and datum maps are the V8 maps with their effective-kernel hypotheses. The curve is proper when B is division; the split rational case is the nonproper modular curve and obtains cusps from R12.2. No general abelian moduli interpretation of this exact G_B is asserted.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Apply V8’s canonical-model output for this exact datum and field; request the explicit non-rational-central-weight coverage if absent.
2. Compare the complex double cosets with the displayed real splitting and reflex embedding.
3. Use quaternionic anisotropy/properness in the division case and the imported modular case when B=M₂(ℚ).

**Prerequisites.** [R18.1/quaternionic-datum](#r18.1-quaternionic-datum), [R18.1/quaternionic-reflex-dimension](#r18.1-quaternionic-reflex-dimension), `ShimuraVarieties:V8/datum-functoriality`, `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V8`, `ModularCurvesPartII:R12.2`, `AdelicAlgebraicGroups:AA.3/arithmetic-quotient-compact`, `mathlib:AlgebraicGeometry.Scheme`.

**API.**

- `TauCeti.HilbertModular.QuaternionicShimuraCurve` (constructor): The canonical finite-level curve over τ(F).
- `TauCeti.HilbertModular.quaternionicCurve_complex` (compatibility): Its complex analytic space is the displayed double-coset quotient.
- `TauCeti.HilbertModular.quaternionicCurve_changeLevel` (functoriality): For U′⊂U the canonical level map commutes with Hecke maps and complex uniformization.
- `TauCeti.HilbertModular.quaternionicCurve_splitQ` (equivalence): For F=ℚ,B=M₂(ℚ), matching levels identify it with R12.2’s modular curve.

**Unit tests.**

- `TauCeti.HilbertModular.curve_Q_split` (compatibility): The split rational curve is noncompact before modular compactification.
- `TauCeti.HilbertModular.curve_Q_division` (computation): An indefinite quaternion algebra over ℚ ramified at two finite primes yields a compact curve.
- `TauCeti.HilbertModular.curve_definite` (non-example): The totally definite datum is not passed to this one-dimensional constructor.

**Acceptance checks.**

- Compact quaternionic curves have no Hilbert cusp boundary.
- Every level-map statement carries effective stabilizer conditions.

**Uses.**

- R18.2: Provide the canonical generic fibre of quaternionic integral models.
- R18.4/R18.5: Supply exact level and reflex-field inputs to cohomology and bad-prime uniformization.

**Source contracts.**

- [H0/YZ18](#h0-yz18), §4.1, p.561, complex uniformization and compactness: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/R181`; namespace `TauCeti.HilbertModular`.

**Planet.** Canonical quaternionic curve.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="r18.1-quaternionic-effective-stabilizers"></a>

### Quaternionic central kernel and small levels

`HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-effective-stabilizers` · theorem · `TauCeti.HilbertModular.quaternionic_effective_stabilizers`

At finite complex level, quotient Γ_g=B_+×∩g Ug⁻¹ by its rational scalar subgroup before measuring freeness on H. On the adelic inverse tower the ineffective central subgroup is the closure of F× in B_f×; it is not in general the discrete subgroup F×. For the compact division case and U⊂(1+NÔ_B)× with N≥3, the effective Γ_g acts freely and each compact connected component has genus≥2. No genus≥2 conclusion is applied to the noncompact split rational curve.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Separate the rational archimedean stabilizer from the adelic closure kernel of the entire tower.
2. For a noncentral fixed-point γ, its generated field is CM and γ/γ̄ is a root of unity congruent 1 modulo N;N≥3 forces it to be 1, hence γ central.
3. After removing those scalars, obtain a free H uniformization; compactness and hyperbolic area give genus≥2.

**Prerequisites.** [R18.1/canonical-quaternionic-curve](#r18.1-canonical-quaternionic-curve), `ReductiveGroupsPartII:RG2.0`, `ReductiveGroupsPartII:RG2.3`, `ShimuraVarieties:V8/finite-level-maps`.

**Acceptance checks.**

- At small levels elliptic stabilizers are retained.
- For F≠ℚ the closure distinction is carried through every tower quotient.

**Source contracts.**

- [H0/YZ18](#h0-yz18), §4.1, pp.561–562 and Proposition 4.1: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/R181`; namespace `TauCeti.HilbertModular`.

**Planet.** Quaternionic effective levels.

<a id="r18.1-yz-bridge-groups"></a>

### Yuan–Zhang PEL bridge groups

`HilbertModularVarietiesAndShimuraCurves:R18.1/yz-bridge-groups` · definition · `TauCeti.HilbertModular.YuanZhangBridgeGroups`

Choose a quadratic CM extension E/F and nearby CM types Φ₁,Φ₂ differing at τ. Define G″=Res_{F/ℚ}(B××_{F×}E×), quotienting by(a⁻¹,a). Its derived group is Res B¹;ν(b,e)=(Nrd(b)eē,e/ē) identifies its derived quotient with Res F××Res E¹. Define G′ by ν₁ lying in diagonal G_m. Lift the datum withh_E(z)=(1,z⁻¹,…,z⁻¹). The bridge is auxiliary; it does not redefine the quaternionic datum.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Use the imported central quotient and restriction-of-scalars constructions with the specified(a⁻¹,a) kernel.
2. Compute ν and its kernel from the quaternion reduced norm and CM conjugation.
3. Combineh_B andh_E and verify that ν₁ is rational scalar onh′.

**Prerequisites.** [R18.1/quaternionic-datum](#r18.1-quaternionic-datum), `ShimuraData:D4/datum-morphism`, `ReductiveGroupsPartII:RG2.0a`.

**API.**

- `TauCeti.HilbertModular.YuanZhangBridgeGroups` (constructor): The central quotient G″ and scalar ν₁ subgroup G′ on imported group carriers.
- `TauCeti.HilbertModular.yzBridge_norm` (data): ν₁=Nrd(b)eē and ν₂=e/ē.
- `TauCeti.HilbertModular.yzBridge_derived` (compatibility): Both bridge groups have derived group Res B¹.
- `TauCeti.HilbertModular.yzBridge_datum` (constructor): The liftedh′ is induced by(h_B,h_E) with the displayed CM-type convention.

**Unit tests.**

- `TauCeti.HilbertModular.bridge_kernel` (computation): The pair(a⁻¹,a) has ν₁=1 and ν₂=1 for everya∈F×.
- `TauCeti.HilbertModular.bridge_scalar` (non-example): An arbitrary ν₁∈F× is allowed in G″ but not in G′ unless it is rational scalar.
- `TauCeti.HilbertModular.bridge_active` (compatibility): At τ theh_E factor is 1; at all other CM factors it isz⁻¹.

**Acceptance checks.**

- The bridge has the same connected adjoint curve geometry but a different centre and reflex field.

**Uses.**

- YZ§3.1: Construct a Hodge/PEL realization for comparison with the quaternionic curve.
- R18.2: Retain the exact auxiliary groups used for integral andp-divisible comparisons.

**Source contracts.**

- [H0/YZ18](#h0-yz18), §3.1, pp.550–551, defining G″,ν and G′: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/R181`; namespace `TauCeti.HilbertModular`.

**Planet.** Quaternionic PEL bridge.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="r18.1-yz-bridge-reflex"></a>

### Weighted CM reflex field of the bridge

`HilbertModularVarietiesAndShimuraCurves:R18.1/yz-bridge-reflex` · theorem · `TauCeti.HilbertModular.yz_bridge_reflex`

The reflex field F′ of(G′,h′), and likewise(G″,h″), is the field fixing the weighted CM type Φ₁+Φ₂=2(Φ₁∩Φ₂)+τ₁+τ₂. It contains τ(F), because a stabilizer fixes the unique weight-one pair and hence its restriction to F. Equality F′=F is not asserted. In Carayol’s special E=F(√λ), λ∈ℚ<0, with the displayed nearby types,F′=E in the chosen embedding.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Compute the cocharacter multiplicities on E through the two nearby types.
2. Identify the Galois stabilizer of the weighted set and its unique weight-one restriction.
3. Compute the special quadratic-over ℚ case separately; preserve the inclusion τ(F)⊂F′ in the comparison maps.

**Prerequisites.** [R18.1/yz-bridge-groups](#r18.1-yz-bridge-groups), `ShimuraData:D3/reflex-field`, [R18.1/quaternionic-reflex-dimension](#r18.1-quaternionic-reflex-dimension).

**Acceptance checks.**

- Comparison with the quaternionic curve requires base change to F′.

**Source contracts.**

- [H0/YZ18](#h0-yz18), Proposition 3.1, p.551; special case§3.2, p.552; §5.1, p.571: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/R181`; namespace `TauCeti.HilbertModular`.

<a id="r18.1-yz-pel-instance"></a>

### Quaternionic PEL bridge instance

`HilbertModularVarietiesAndShimuraCurves:R18.1/yz-pel-instance` · construction · `TauCeti.HilbertModular.quaternionicPELInstance`

Let B′=B⊗_FE, V′=B′ with its left B′ module structure. Choose invertible γ′ with γ̄′=−γ′ and with the required archimedean positivity. Set ψ′(v,w)=Tr_{E/ℚ}Trd_{B′/E}(γ′v w̄), and*=γ′⁻¹ℓ̄γ′. Specialize M0/M1 to obtain the G′ PEL moduli over F′: abelian schemes up to isogeny, B′ action with the full determinant condition determined by Φ₁+Φ₂, polarization with this Rosati involution, and U′-orbit of rational adelic similitude frames. An arbitrary anti-fixed γ′ need not be polarizing.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Compute alternation, nondegeneracy and the adjoint involution from γ̄′=−γ′.
2. Check the positivity of γ′ againsth′ rather than inferring it from anti-fixity.
3. Apply the imported rational PEL moduli construction and identify the weighted characteristic polynomial; characteristic-zero trace data here determines the semisimple multiplicities, but the full determinant condition remains the stored interface.

**Prerequisites.** [R18.1/yz-bridge-groups](#r18.1-yz-bridge-groups), [R18.1/yz-bridge-reflex](#r18.1-yz-bridge-reflex), `PELModuli:M0/integral-pel-datum`, `PELModuli:M0/determinant-condition`, `PELModuli:M1/char-zero-adelic-moduli`, `PELModuli:M3/complex-points`, `mathlib:AlgebraicGeometry.Scheme`.

**API.**

- `TauCeti.HilbertModular.quaternionicPELInstance` (constructor): The M0/M1 specialization with B′,ψ′,* andh′.
- `TauCeti.HilbertModular.quaternionicPEL_form` (data): The exact reduced-trace formula for ψ′.
- `TauCeti.HilbertModular.quaternionicPEL_adjoint` (compatibility): ψ′(ℓv,w)=ψ′(v,ℓ*w) with*=γ′⁻¹ℓ̄γ′.
- `TauCeti.HilbertModular.quaternionicPEL_moduli` (equivalence): The four data of YZ p.552 are the corresponding rational PEL moduli objects at sufficiently small U′.

**Unit tests.**

- `TauCeti.HilbertModular.qpel_nonzero` (non-example): γ′=0 is excluded: it would make ψ′ degenerate.
- `TauCeti.HilbertModular.qpel_positive` (non-example): Replacing a polarizing γ′ by−γ′ reverses the archimedean sign and cannot pass the same positivity test.
- `TauCeti.HilbertModular.qpel_adjoint` (compatibility): The left B′ action has exactly the stated Rosati involution, including the γ′ conjugation.

**Acceptance checks.**

- No generic PEL engine or abelian dual theory is rebuilt.

**Uses.**

- YZPropositions 4.2–4.4: Supply the auxiliary canonical PEL curve for component comparison.
- R18.2: Provide its exact generic datum before constructing an integral model.

**Source contracts.**

- [H0/YZ18](#h0-yz18), §3.1, p.552, equations(3.1.1)–(3.1.2) and four moduli conditions: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/R181`; namespace `TauCeti.HilbertModular`.

**Closure obligations.** Prototype signatures requiring unavailable supplier carriers. See the closure ledger.

<a id="r18.1-yz-component-comparison"></a>

### Quaternionic and PEL connected comparisons

`HilbertModularVarietiesAndShimuraCurves:R18.1/yz-component-comparison` · comparison · `TauCeti.HilbertModular.yz_component_comparison`

After base change to an algebraic closure containing F′ and choosing compatible identity components, the quaternionic tower component X⁰ and the PEL component X′⁰ have the YZ Proposition 4.2 isomorphism, intertwining the identified effective positive-norm stabilizers through G_B→G″. For idealsn supported at p and prime tod_B, and sufficiently small U^p depending onn, there is a matching U′^p and a finite-level connected comparison X_{n,U^p}⁰≅X′_{n,U′^p}⁰. Its field and descent maps must be specified: the printed Proposition 4.4 says “over K” without defining K in this passage; restoration from Carayol is a recorded gap.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Identify the connected adjoint domains and the effective positive-norm arithmetic actions, preserving all central quotients.
2. Apply the finite-level subgroup comparison with n prime tod_B and choose U^p small enough for thatn.
3. Descend a finite-type comparison only after choosing its actual field of definition and checking the required local/unramified field used by R18.2; do not invent K from the notation.

**Prerequisites.** [R18.1/canonical-quaternionic-curve](#r18.1-canonical-quaternionic-curve), [R18.1/quaternionic-effective-stabilizers](#r18.1-quaternionic-effective-stabilizers), [R18.1/yz-pel-instance](#r18.1-yz-pel-instance), `ShimuraVarieties:V8/finite-level-maps`.

**Acceptance checks.**

- U^p is allowed to depend onn.
- No ramified-quaternion prime level comparison is inferred from this prime-to-d_B theorem.

**Source contracts.**

- [H0/YZ18](#h0-yz18), Propositions 4.2 and 4.4, p.563: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/R181`; namespace `TauCeti.HilbertModular`.

**Closure obligations.** Carayol descent field in the finite-level bridge. See the closure ledger.

<a id="r18.1-yz-torus-bridge"></a>

### Torus bridge for quaternionic towers

`HilbertModularVarietiesAndShimuraCurves:R18.1/yz-torus-bridge` · comparison · `TauCeti.HilbertModular.yz_torus_bridge`

Let Ψ=Φ₁∩Φ₂ and Y/F′ be the zero-dimensional CM torus Shimura tower for Res_{E/ℚ}G_m withh_Ψ(z)=(1,z⁻¹,…,z⁻¹). The product datum map induces X×_FY→X″ over F′, and the tower comparison(X×_FY)/Δ(A_{F,f}×)≅X″ uses the twisted diagonalz↦(z,z⁻¹). At finite levels use the image U″ of U×J and the induced surjective map; an identical finite quotient description at all levels is not automatic. The Tate-module tensor and integral extensions belong to R18.2.

**Hypotheses.**

- F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.

**Proof route.**

1. Apply the generic torus datum/canonical-model supplier to Ψ and form the product over the common reflex field.
2. Compute the kernel of B××E×→G″ as the twisted diagonal F× and compare the complex tower quotients including central closures.
3. Check finite-level image groups separately; export the specific map to the R18.2 owner for the Tate/p-divisible tensor comparison.

**Prerequisites.** [R18.1/yz-bridge-groups](#r18.1-yz-bridge-groups), [R18.1/yz-bridge-reflex](#r18.1-yz-bridge-reflex), [R18.1/canonical-quaternionic-curve](#r18.1-canonical-quaternionic-curve), `ShimuraData:D4/product-datum`, `ShimuraVarieties:V8/datum-functoriality`.

**Acceptance checks.**

- Y is zero-dimensional, so the bridge still has curve dimension 1.
- The inverse in(z,z⁻¹) is essential.

**Source contracts.**

- [H0/YZ18](#h0-yz18), §5.1, pp.571–572, product map and twisted diagonal quotient: The passage fixes the object or comparison convention. The assertion records its explicit hypotheses; proof steps separate the specialization from imported general theory and any source correction.

**Planned library location.** `TauCeti/ArithmeticGeometry/HilbertModular/R181`; namespace `TauCeti.HilbertModular`.

<a id="r18.2"></a>

## R18.2. Compactification and integral models

The fine tower is the source of universal torsion and deformation data. Coarse quotients retain normality and the rational Hodge line, but they do not inherit regularity or a universal family without a separate argument. The divisor factor in integral Kodaira–Spencer is fixed before transporting the torus bridge.

<a id="r18.2-quaternion-pel-instance"></a>

### Quaternionic auxiliary PEL instance

`HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pel-instance` · construction · `TauCeti.Blueprint.Quaternionic.QuaternionPELInstance`

For E=F(√λ), λ<0 rational with p split in Q(√λ), specialize the shared PEL datum to B′=B⊗F E, V′=B′, ψ′(x,y)=Tr_E/Q Trd_B′/E(γ′xȳ), and involution b*=γ′⁻¹ b̄γ′. At p use O_B′,p=O_B,p*⊕O_B,p and the self-dual lattice O_B,p^∨⊕O_B,p. Verify the special O_B,v Lie condition and zero Lie component away from v. This full regular representation has abelian dimension 4[F:Q]; the Morita-reduced E-representation has dimension 2[F:Q]. Generic PEL moduli and representability are imports.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- γ′ chosen with the required positivity; sufficiently small tame level; integral trace/different factors retained.

**Proof route.**

1. Check involution, trace pairing and positivity on the existing PEL carriers.
2. Compute the split E_p factors, dual lattice and determinant/Lie condition; use Carayol §2 and YZ §3.2, with the reviewed dimension correction.
3. Use the PEL representability theorem only at its verified good primes; division-prime geometry is supplied independently by R18.5.

**Prerequisites.** `PELModuli:M0`, `PELModuli:M1`, `PELModuli:M2`, [R18.1/yz-pel-instance](#r18.1-yz-pel-instance), [R18.1/canonical-quaternionic-curve](#r18.1-canonical-quaternionic-curve).

**API.**

- `QuaternionPELInstance.tracePairing` (data): The specialized pairing is Tr_E/Q Trd(γ′xȳ), with its induced involution.
- `QuaternionPELInstance.selfDual` (characterisation): The chosen p-lattice equals its pairing dual.
- `QuaternionPELInstance.lieCondition` (characterisation): The active v-part is special of rank one over the unramified quadratic order, and the complementary Lie part is zero.
- `QuaternionPELInstance.genericComparison` (compatibility): The represented generic curve is the auxiliary canonical X′ at the specified level.

**Unit tests.**

- `QuaternionPELInstance.regularDimension` (computation): For F=Q the full B′ regular representation yields abelian dimension 4, not 2.
- `QuaternionPELInstance.moritaDimension` (compatibility): For F=Q the Morita-reduced E-instance yields abelian dimension 2.
- `QuaternionPELInstance.dualLattice` (non-example): If the trace lattice is not self-dual, O_B,p⊕O_B,p fails the perfect-pairing test; replacing the first factor by its dual passes.

**Acceptance checks.**

- Full B′ regular module has Q-dimension 8[F:Q], hence abelian dimension 4[F:Q].
- The dual lattice pairing is perfect even when the trace different is nontrivial.

**Uses.**

- Carayol §§2,4–5 and YZ Proposition 3.2: Supplies the actual auxiliary object used to construct integral quaternionic curves, with no new generic PEL engine.

**Source contracts.**

- [R18.2/yz](#r18-2-yz), §§3.1–3.2, pp.551–555: Specialized integral datum; correct dimension using PAPER-YUAN-ZHANG-18/E19.

**Planet.** Quaternionic PEL datum.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.2-effective-small-level"></a>

### Effective small level and genus

`HilbertModularVarietiesAndShimuraCurves:R18.2/effective-small-level` · theorem · `TauCeti.Blueprint.Quaternionic.EffectiveSmallLevel`

If U⊂(1+N O_B)^× with integer N≥3, each geometric connected component of X_U has genus at least 2 and its arithmetic group acts freely on the upper half-plane after quotienting by F×. The effective tower action divides out the closure of F× in B_f×; for F≠Q the closure must not be replaced by the discrete rational centre.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- Compact curve hypothesis; principal level N≥3.

**Proof route.**

1. Specialize R18.1/quaternionic-effective-stabilizers to the compact canonical tower and the chosen principal integral order level.
2. Reuse its scalar-stabilizer, central-closure and hyperbolic genus conclusions; no second small-level theorem is constructed in R18.2.

**Prerequisites.** [R18.1/quaternionic-effective-stabilizers](#r18.1-quaternionic-effective-stabilizers).

**Acceptance checks.**

- The full arithmetic stabiliser can contain infinitely many central units; only the effective stabiliser is trivial.
- The Q split modular curve requires compactification and is imported separately.

**Source contracts.**

- [R18.2/yz](#r18-2-yz), §4.1, pp.561–562, Proposition 4.1: Small-level freeness modulo centre and genus bound.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.2-quaternion-pdiv-tower"></a>

### Quaternionic p-divisible sheaf

`HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pdiv-tower` · definition · `TauCeti.Blueprint.Quaternionic.QuaternionPDiv`

On the pro-level canonical curve define H_n=(B_p/O_B,p×X)/U_p(n), with U_p(n)=(1+n O_B,p)^× acting on the fibre by right multiplication and n supported above p. For each fixed torsion level m, shrink tame level until U_p(1)/U_p(m) acts freely; H_n[m] then descends as a finite étale O_B,p-module on that finite generic level. Do not assert a common finite tame level for the entire p-divisible group without proof.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- The effective free pro-level action and all fibre actions are specified; n may be 1.

**Proof route.**

1. Use the quotient/torsor construction on the imported tower.
2. Construct compatible finite torsion sheaves, verifying freeness at each torsion level.
3. Take the filtered union and descend each finite stage, with tame level allowed to depend on that stage.

**Prerequisites.** [R18.2/effective-small-level](#r18.2-effective-small-level), [R18.1/canonical-quaternionic-curve](#r18.1-canonical-quaternionic-curve), `PELModuli:M1`.

**API.**

- `QuaternionPDiv.torsion` (projection): H_n[m] has fibre m⁻¹O_B,p/O_B,p.
- `QuaternionPDiv.changeLevel` (functoriality): Pullback along n′-level to n-level identifies H_n with H_n′.
- `QuaternionPDiv.splitMorita` (compatibility): At split v, e11H_v identifies with Carayol E∞.
- `QuaternionPDiv.finiteDescent` (structure): For each m a sufficiently small tame level supports its descended finite étale sheaf.

**Unit tests.**

- `QuaternionPDiv.unitTorsion` (degenerate): H_n[O_F]=0.
- `QuaternionPDiv.splitRank` (computation): For F_v=Q_p and B_v=M₂(Q_p), H_v[p] has geometric cardinality p^4; e11H_v[p] has cardinality p^2.
- `QuaternionPDiv.rightAction` (characterisation): A local unit u sends a fibre element x to xu; replacing it by ux generally gives a different action.

**Acceptance checks.**

- At a split v, e11H_v is Carayol’s one-dimensional O_v-divisible group E∞.
- The quotient action on the coefficient fibre is right multiplication.

**Uses.**

- YZ Propositions 4.3–4.4 and Theorem 4.9: Compares coefficient sheaves and constructs the integral deformation and level interpretation.
- AutomorphicGaloisRepresentations:R19.2: Supplies geometric coefficient objects before constructing Galois representations.

**Source contracts.**

- [R18.2/yz](#r18-2-yz), §4.1, p.562, p-divisible groups: Associated p-divisible sheaf and finite torsion descent.

**Planet.** Quaternionic p-divisible group.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.2-connected-pel-comparison"></a>

### Connected quaternionic and PEL comparison

`HilbertModularVarietiesAndShimuraCurves:R18.2/connected-pel-comparison` · comparison · `TauCeti.Blueprint.Quaternionic.ConnectedPelComparison`

Over F̄ identify the identity pro-components X⁰ and X′⁰ equivariantly for the norm-positive effective groups Δ̄≅Δ̄′. After quotient by O_B,p^1, whose identity components X₁⁰ and X′₁⁰ are defined over K, identify H|X₁⁰ with H′|X′₁⁰ with the transported effective group action. The comparison is of connected components with specified descent, not an isomorphism of the full unrelated global towers.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- The auxiliary split CM choice and effective central kernels are fixed.

**Proof route.**

1. Reuse R18.1/yz-component-comparison for the geometric connected components over a common algebraic closure; apply Carayol §4.2 for the pro-tower and norm-one quotient. The geometric supplier does not close the K-descent obligation recorded below.
2. Transport the p-divisible coefficients by §4.4, retaining the centre quotient.
3. Check the norm-one quotient and equivariance, correcting the printed inclusion to an isomorphism.

**Prerequisites.** [R18.2/quaternion-pel-instance](#r18.2-quaternion-pel-instance), [R18.2/quaternion-pdiv-tower](#r18.2-quaternion-pdiv-tower), [R18.1/yz-component-comparison](#r18.1-yz-component-comparison).

**Acceptance checks.**

- The component maps commute with effective group action.
- The generic coefficient comparison induces the same finite-torsion map.

**Source contracts.**

- [R18.2/yz](#r18-2-yz), §4.1, pp.562–563, Propositions 4.2–4.3: Connected-component and p-divisible comparisons, corrected E39.
- [R18.2/carayol](#r18-2-carayol), §§4.2,4.4: Primary comparison of the connected canonical and auxiliary PEL curves.

**Closure obligations.** Missing formal carriers in suggested Lean; Cross-part connected-comparison descent over K. See the closure ledger.

<a id="r18.2-finite-pel-comparison"></a>

### Finite-level PEL comparison

`HilbertModularVarietiesAndShimuraCurves:R18.2/finite-pel-comparison` · comparison · `TauCeti.Blueprint.Quaternionic.FinitePelComparison`

For n supported above p and coprime to d_B, and tame U^p sufficiently small depending on n, choose U′^p so that the connected n-level quaternionic and auxiliary PEL curves are isomorphic over K; the maps and coefficient sheaves agree under this isomorphism.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- n prime to the quaternion discriminant; smallness depends on n.

**Proof route.**

1. Use the connected and coefficient comparisons to identify level trivialisations.
2. Choose finite-level tame subgroups killing the effective residual action as in Carayol Proposition 4.5.5.
3. The named R18.1 supplier gives the geometric finite-level comparison only. Restore the exact Carayol descent field and cocycle before asserting the target over K; see the consuming-part gap.

**Prerequisites.** [R18.2/connected-pel-comparison](#r18.2-connected-pel-comparison), [R18.1/yz-component-comparison](#r18.1-yz-component-comparison).

**Acceptance checks.**

- Do not replace “depending on n” by uniform smallness.
- No p-level at a division place is covered by this coprime-to-d_B comparison.

**Source contracts.**

- [R18.2/yz](#r18-2-yz), Proposition 4.4, pp.563–564: Finite-level passage with the discriminant restriction.

**Closure obligations.** Missing formal carriers in suggested Lean; Cross-part connected-comparison descent over K. See the closure ledger.

<a id="r18.2-carayol-split-model"></a>

### Carayol split-place integral model

`HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model` · theorem · `TauCeti.Blueprint.Quaternionic.CarayolSplitModel`

If B_v is split, U_v=GL₂(O_v) and tame level is sufficiently small, X_U has a proper smooth model over O_v with canonical generic fibre; at principal v^n level the normalised cover is the regular model representing the Drinfeld-basis level problem on the special one-dimensional height-two O_v-divisible group. Transition and tame Hecke maps extend over O_v. Higher v-level models are not asserted smooth or semistable.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- Carayol assumes [F:Q]>1; for Q use the modular or fake-elliptic supplier separately.
- The p-components away from v meet the source’s fixed-level hypotheses.

**Proof route.**

1. Construct the auxiliary integral moduli problem by Carayol §5 and its special p-divisible factor.
2. Apply Serre–Tate/deformation theory and Drinfeld bases in §§6–7.
3. Transfer through the connected PEL comparison and normalisation in §9.

**Prerequisites.** [R18.2/finite-pel-comparison](#r18.2-finite-pel-comparison), `PELModuli:M2`, `PELModuli:M4`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

**Acceptance checks.**

- Maximal split v-level is smooth.
- At nonmaximal v-level assert regularity only, with actual completed local deformation ring.

**Source contracts.**

- [R18.2/carayol](#r18-2-carayol), §0.2, §§5.4,6–7,9: Split finite place and Drinfeld-level regularity.

**Planet.** Carayol integral model.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.2-regular-model-tower"></a>

### Regular quaternionic model tower

`HilbertModularVarietiesAndShimuraCurves:R18.2/regular-model-tower` · theorem · `TauCeti.Blueprint.Quaternionic.RegularModelTower`

Let n be coprime to d_B and U^p⊂U^p(N) for an integer N≥3 prime to p. The minimal regular models X_{n,U^p}/O_v form a projective system extending canonical level maps. At v∤n the model is smooth if B_v splits and a semistable relative Mumford curve if B_v is division. The division case has maximal local level.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- Fine principal tame level as stated; no assertion for arbitrary level at d_B.

**Proof route.**

1. Use split-place Carayol geometry and the division-place formal uniformisation separately.
2. Use genus≥2 minimal regular-model uniqueness and the effective-level freeness argument of YZ Theorem 4.5.
3. Extend transition maps through the common moduli/normalisation interpretation.

**Prerequisites.** [R18.2/effective-small-level](#r18.2-effective-small-level), [R18.2/carayol-split-model](#r18.2-carayol-split-model), [R18.5/totally-real-uniformisation](#r18.5-totally-real-uniformisation), `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

**Acceptance checks.**

- Division special-fibre components over k̄ are P¹ and nodes have local equation xy=π at fine maximal level.
- Refinement in split p-level need not retain a nodal special fibre.

**Source contracts.**

- [R18.2/yz](#r18-2-yz), §4.2, Theorem 4.5, pp.564–565: Regular projective tower with exact local good/bad conditions.

**Planet.** Regular quaternionic models.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.2-coarse-model"></a>

### Coarse quaternionic integral models

`HilbertModularVarietiesAndShimuraCurves:R18.2/coarse-model` · theorem · `TauCeti.Blueprint.Quaternionic.CoarseModel`

For any decomposed compact open U maximal at each prime dividing d_B, construct X_U as the effective finite quotient of a sufficiently small normal fine model. It is normal, projective and flat over O_F, independent of the auxiliary prime used to rigidify level, and has canonical generic fibre. The quotient map is finite of degree the effective group order; it need not be flat everywhere or have regular target.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- Fine normal cover U′⊂U and effective group Ū/Ū′; maximality at d_B.

**Proof route.**

1. Choose auxiliary p coprime to 2d_B with maximal U_p and principal p-level.
2. Take the finite invariant quotient on the imported scheme-quotient carrier.
3. Compare two auxiliary primes using the regular tower; deduce normality, projectivity and flatness over the Dedekind base.

**Prerequisites.** [R18.2/regular-model-tower](#r18.2-regular-model-tower), `PELModuli:M4`, `tauceti:TauCetiRoadmap/StableReduction#layer-0-relative-curves-and-extensions-of-dvrs`, `mathlib:AlgebraicGeometry.Flat`.

**Acceptance checks.**

- Degree uses effective quotient, not the raw central-unit group.
- Local flatness of X_U/O_F does not imply flatness of X_U′/X_U.

**Source contracts.**

- [R18.2/yz](#r18-2-yz), §4.2, p.565 and Corollary 4.6: Coarse quotients with honest flatness scope.

**Planet.** Coarse integral models.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.2-hecke-integral-extension"></a>

### Integral Hecke extensions

`HilbertModularVarietiesAndShimuraCurves:R18.2/hecke-integral-extension` · theorem · `TauCeti.Blueprint.Quaternionic.HeckeIntegralExtension`

For admissible levels maximal at d_B, a finite generic level map extends to the model tower. Tame Hecke correspondences whose local v-component preserves the specified model problem extend via the two finite maps from the common intersection level, with composition and generic-fibre agreement. Finite étaleness over O_v is asserted only when local p-level/lattice data are unchanged and the relevant PEL deformation criterion applies.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- Both source, target and intersection levels satisfy the model hypotheses.
- No unqualified extension of every p-isogeny as an étale map.

**Proof route.**

1. Use the projective-system maps and transport the adelic g-action through the local integral moduli interpretation.
2. Apply finite-map comparison and normalization for each leg.
3. Check Hecke composition on the generic fibre and use separatedness for uniqueness.

**Prerequisites.** [R18.2/regular-model-tower](#r18.2-regular-model-tower), [R18.2/coarse-model](#r18.2-coarse-model), `AdelicAlgebraicGroups:AA.4`.

**Acceptance checks.**

- A p-level refinement is finite but may be ramified in the special fibre.
- At unchanged p-components the tame cover is étale on fine models.

**Source contracts.**

- [R18.2/yz](#r18-2-yz), Theorem 4.5 and Corollary 4.6, pp.564–566: Integral tower and finite correspondence specialization.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.2-qfactorial-model"></a>

### Q-factorial coarse models

`HilbertModularVarietiesAndShimuraCurves:R18.2/qfactorial-model` · theorem · `TauCeti.Blueprint.Quaternionic.QfactorialModel`

If L/F is finite and unramified at all finite places where B ramifies or U is not maximal, X_U⊗O_L is Q-factorial: every Weil divisor has a positive multiple Cartier. This does not assert regularity of the coarse model.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- U maximal at d_B; unramified base change at the bad set.

**Proof route.**

1. Use regular fine covers after the allowed base extension.
2. Apply the product norm over the finite quotient to local divisor equations.
3. Use two auxiliary primes to cover the entire arithmetic surface.

**Prerequisites.** [R18.2/coarse-model](#r18.2-coarse-model), `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Acceptance checks.**

- The positive Cartier multiple may be the effective quotient degree.
- Ramified base change at a node can destroy regularity, so do not remove the base-change hypothesis.

**Source contracts.**

- [R18.2/yz](#r18-2-yz), Corollary 4.6(2), p.566: Q-factoriality in precisely the source’s base-change range.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.2-arithmetic-hodge-line"></a>

### Quaternionic arithmetic Hodge line

`HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line` · construction · `TauCeti.Blueprint.Quaternionic.QuaternionHodgeLine`

Specialize the imported rational line-bundle and metric theory to the unique hermitian Q-line L_U on X_U: compatible under level pullback, equal locally to the relative dualizing line at fine level and maximal U_v, with archimedean norm |dz|=2 Im z. On the coarse generic fibre L_U=ω_{X_U/F}+Σ_Q(1−1/e_Q)[Q]. Extend by norms from fine models and glue away from two auxiliary primes.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- U maximal at d_B; fine models and rational line bundles supplied; e_Q is the effective ramification index.

**Proof route.**

1. Apply the generic divisor/line and norm/descent API on each rigidifying cover.
2. Normalize by the effective degree and glue; the regular model tower proves independence.
3. Check the archimedean metric against the explicit Hodge calculation, using the corrected sign.

**Prerequisites.** [R18.2/qfactorial-model](#r18.2-qfactorial-model), `AutomorphicBundles:B2`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`, `ArakelovGeometryAndAbelianHeights:R35.2`.

**API.**

- `QuaternionHodgeLine.pullback` (functoriality): Every admissible level map pulls L_target back to L_source.
- `QuaternionHodgeLine.fineDualizing` (compatibility): At fine maximal local level L_U|O_v is the relative dualizing line.
- `QuaternionHodgeLine.coarseCorrection` (characterisation): At branch point Q the correction coefficient is 1−1/e_Q.
- `QuaternionHodgeLine.metric` (data): Under uniformisation the differential dz has norm 2 Im z.
- `QuaternionHodgeLine.unique` (characterisation): Any system of hermitian Q-line bundles on the models X_U (U maximal at d_B) that is compatible with level pullback, equals the relative dualizing line at fine level and maximal U_v, and has archimedean metric |dz|=2 Im z, is canonically isomorphic to L_U (YZ Theorem 4.7, uniqueness).

**Unit tests.**

- `QuaternionHodgeLine.unramified` (degenerate): When every e_Q=1, the generic L_U equals ω.
- `QuaternionHodgeLine.indexTwo` (computation): At an effective ramification point of index 2, the correction is [Q]/2.
- `QuaternionHodgeLine.imaginaryUnit` (computation): At z=i, |dz|=2.

**Acceptance checks.**

- Coarse branch corrections are required; ω alone fails pullback compatibility.
- The metric is 2y, not y or its reciprocal.

**Uses.**

- YZ Theorem 4.10 and ArakelovGeometryAndAbelianHeights:R35.2: Exports the quaternionic arithmetic Hodge line and its metric; generic hermitian/Q-line and norm theory remain supplier work.

**Source contracts.**

- [R18.2/yz](#r18-2-yz), §4.2, Theorem 4.7, pp.567–568: Specialized arithmetic Q-line, including effective ramification.

**Planet.** Arithmetic Hodge bundle.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.2-integral-pdiv"></a>

### Integral quaternionic p-divisible group

`HilbertModularVarietiesAndShimuraCurves:R18.2/integral-pdiv` · theorem · `TauCeti.Blueprint.Quaternionic.IntegralPdiv`

For n prime to d_B the generic H_n extends over the pro-limit of fine models over O_K. Its v-factor is a strict special formal O_B,v-module and the factors away from v are étale. The completed maximal-local-level model is the deformation space with the prescribed O_B-action; n=v^a n′ level classifies a Drinfeld v^a-basis and a full étale n′-level structure. At division v the allowed n has a=0.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- Strict O_v-module convention; active relative Lie rank 2 and O_v-height 4; absolute p-height 4[F_v:Q_p].

**Proof route.**

1. Transfer the auxiliary PEL p-divisible group using connected components and finite torsion descent.
2. Apply Carayol deformation theory at split v and Drinfeld representability at division v.
3. Recover the exact integral level problem; retain strictness and coefficient component conditions.

**Prerequisites.** [R18.2/quaternion-pdiv-tower](#r18.2-quaternion-pdiv-tower), [R18.2/regular-model-tower](#r18.2-regular-model-tower), [R18.5/drinfeld-representability](#r18.5-drinfeld-representability), `PELModuli:M1`.

**Acceptance checks.**

- An absolute Dieudonné crystal at ramified F_v has rank 4[F_v:Q_p], not 4.
- Do not classify unrestricted division p-levels by this theorem.

**Source contracts.**

- [R18.2/yz](#r18-2-yz), Theorem 4.9, pp.568–569: Integral special factor, relative deformation and discriminant-qualified levels.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.2-integral-kodaira-spencer"></a>

### Integral quaternionic Kodaira–Spencer

`HilbertModularVarietiesAndShimuraCurves:R18.2/integral-kodaira-spencer` · theorem · `TauCeti.Blueprint.Quaternionic.IntegralKodairaSpencer`

Using the strict O_v-relative crystal with rank-2 Hodge pieces W,W^t, set N=det W⊗det W^t. The determinant of the Kodaira–Spencer map identifies N with ω^{⊗2}(−d_B,v), where d_B,v=0 at split v and the reduced special fibre at division v. At ramified F_v/Q_p this target requires the relative/saturated filtration, not the raw τ-quotient of the absolute crystal.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- Fine regular finite-level models; maximal v-level; relative Dieudonné filtration and Cartier dual convention explicitly supplied.

**Proof route.**

1. Apply the relative Grothendieck–Messing tangent calculation; split matrix idempotents give the unramified B_v case.
2. At division v compute on the smooth locus of the special fibre and on the generic fibre; both j-maps can be nonunits at nodes.
3. Extend the determinant isomorphism across codimension two on the regular surface; retain the source repair gap for the ramified relative filtration.

**Prerequisites.** [R18.2/integral-pdiv](#r18.2-integral-pdiv), [R18.2/arithmetic-hodge-line](#r18.2-arithmetic-hodge-line), `CrystallineCohomology:CR.7`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Acceptance checks.**

- The determinant is det W⊗det W^t, not det W∨⊗det W^t.
- At xy=π, x and y are both nonunits at the node; this does not invalidate extension across codimension two.

**Source contracts.**

- [R18.2/yz](#r18-2-yz), Theorem 4.10, pp.569–570: Corrected determinant and relative crystal; E8, E9 (review-amended correction), E30.

**Closure obligations.** Ramified relative Kodaira–Spencer; Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.2-bridge-tate-comparison"></a>

### Torus bridge and Tate coefficients

`HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-tate-comparison` · comparison · `TauCeti.Blueprint.Quaternionic.BridgeTateComparison`

Import the canonical torus Y and datum morphism (X×Y)/Δ(A_F,f×)≅X″ from R18.1, with Δ(z)=(z,z⁻¹) and effective rational-central closures. On X₁×Y₁, identify f₁*T(H″) with π₁*T(H)⊗O_E,p π₂*T(I), where I=(E_p/O_E,p×Y)/O_E,p×. The two centre actions cancel and H″|X′=H′.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- E embeds in B; the maximal order contains O_E,p, not merely its units; prescribed nearby CM types.

**Proof route.**

1. Apply the imported torus bridge to the actual coefficient actions x(b,e)=exb.
2. Compute the three Tate lattices and tensor over O_E,p.
3. Check diagonal centre cancellation and finite-torsion descent.

**Prerequisites.** [R18.2/quaternion-pdiv-tower](#r18.2-quaternion-pdiv-tower), [R18.1/yz-torus-bridge](#r18.1-yz-torus-bridge), `PELModuli:M1`.

**Acceptance checks.**

- The tensor product is not a Cartesian product of Tate modules.
- The diagonal action is (z,z⁻¹), so its centre acts trivially on the tensor.

**Source contracts.**

- [R18.2/yz](#r18-2-yz), §5.1, pp.571–573, Proposition 5.1: Imported bridge with owned coefficient specialization.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.2-bridge-integral-model"></a>

### Integral torus-bridge model

`HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-integral-model` · theorem · `TauCeti.Blueprint.Quaternionic.BridgeIntegralModel`

Over K′, the completed maximal unramified reflex extension at v′, the bridge identifies X″₁ with the quotient of X₁×Y₁. Extending Y₁ by copies of Spec O_K′ transports the model of X₁ to a flat model of X″₁ and its open-and-closed X′₁ components. It is smooth if B_v splits and has stable Mumford fibres if B_v is division; ramified K′/K base change need not preserve regularity.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- The bridge’s effective quotient and descent data are supplied.

**Proof route.**

1. Extend the zero-dimensional unramified torus components.
2. Descend the product model along the effective diagonal action.
3. Compute the completed node after ramified base change.

**Prerequisites.** [R18.2/bridge-tate-comparison](#r18.2-bridge-tate-comparison), [R18.2/regular-model-tower](#r18.2-regular-model-tower), `AdicSpacesPartII:R2/admissible-formal-scheme`.

**Acceptance checks.**

- After ramification index e, a node has xy=π′^e, which is not regular for e>1.
- No global fine moduli extension of the case-2 universal family is asserted.

**Source contracts.**

- [R18.2/yz](#r18-2-yz), §5.2, pp.573–574: Integral bridge with exact regularity boundary.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.2-bridge-point-extension"></a>

### Pointwise p-divisible extension

`HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-point-extension` · theorem · `TauCeti.Blueprint.Quaternionic.BridgePointExtension`

For a finite L/K′ and points y∈Y₁(L), x′∈X′₁(L), x″∈X″₁(L), the corresponding I_y,H′_x′,H″_x″ extend uniquely over O_L. For H″ use the Tate tensor, checking that at each embedding only one factor contributes weight −1 so that no weight −2 occurs. The p=2 case requires the integral Barsotti–Tate classification including the dyadic theorem. This is pointwise and does not by itself construct a global universal abelian scheme.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- Integral crystalline lattice functor and full faithfulness over O_L; a finite extension may be used to lift the bridge point.

**Proof route.**

1. Compute the torus crystalline character and componentwise weights.
2. Tensor with the strict quaternionic factor, excluding simultaneous weight −1.
3. Apply the all-prime classification and descend using uniqueness/full faithfulness.

**Prerequisites.** [R18.2/bridge-tate-comparison](#r18.2-bridge-tate-comparison), [R18.2/integral-pdiv](#r18.2-integral-pdiv), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

**Acceptance checks.**

- Tensoring two arbitrary {0,−1}-weight representations can produce −2; the component check is necessary.
- For p=2, citing the p>2 classification is insufficient.

**Source contracts.**

- [R18.2/yz](#r18-2-yz), Proposition 5.2, p.574: Pointwise theorem with E34–E35 corrections.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.2-bridge-filtered-crystal"></a>

### Filtered bridge crystal comparison

`HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-filtered-crystal` · comparison · `TauCeti.Blueprint.Quaternionic.BridgeFilteredCrystal`

The covariant filtered integral crystal of H″_x″ is the coefficient tensor of those of H_x and I_y over O_E,p, with base change to O_L. This is a structured crystalline tensor comparison supplied by the integral p-adic Hodge owner. On the τ-part the resulting Hodge-piece tensor formulas hold as direct-summand formulas when F_v/Q_p is unramified; at ramified v raw τ-quotients are not exact.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- Chosen integral crystalline functor, compatible tensor and Hodge filtration; local p=2 coverage supplied.

**Proof route.**

1. Apply the Tate tensor comparison and the integral crystalline functor.
2. At unramified v take exact idempotent summands.
3. At ramified v record the required saturated/relative determinant comparison as a gap rather than asserting τ-exactness.

**Prerequisites.** [R18.2/bridge-point-extension](#r18.2-bridge-point-extension), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

**Acceptance checks.**

- For ramified F_v=Q_p(√p), a mismatched τ-quotient may contain O_L/(2√p).
- The integral statement is stronger than a rational crystalline isomorphism.

**Source contracts.**

- [R18.2/yz](#r18-2-yz), Proposition 5.3 and discussion of Proposition 5.4, pp.574–575: Filtered tensor versus the nonexact ramified τ-quotient; E31.

**Closure obligations.** Ramified bridge determinant; Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.2-bridge-determinant"></a>

### Bridge Hodge determinant cancellation

`HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-determinant` · theorem · `TauCeti.Blueprint.Quaternionic.BridgeDeterminant`

At unramified F_v/Q_p, the rank-one torus Hodge factor twists W(H″) by its dual and W(H″^t) by itself. Thus det W(H″)⊗det W(H″^t)≅(det W(H)⊗det W(H^t))⊗O_L, as lattices in the generic square-canonical line. The same intended ramified-prime export must use a proved saturated determinant comparison; it is an explicit source-repair gap. No equality Hom_OE=Hom_OB or unrestricted OE-linear universal deformation is claimed.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- For the established direct-summand proof F_v/Q_p is unramified; retain the ramified target as a gap.

**Proof route.**

1. Use the filtered tensor comparison and exact τ-idempotent Hodge pieces.
2. Cancel the rank-one factor and its inverse in the two determinants.
3. Use the corrected quaternionic Kodaira–Spencer line; do not use the false rank-2 versus rank-1 Hom identity.

**Prerequisites.** [R18.2/bridge-filtered-crystal](#r18.2-bridge-filtered-crystal), [R18.2/integral-kodaira-spencer](#r18.2-integral-kodaira-spencer).

**Acceptance checks.**

- Hom_OE has generic rank 2 while Hom_OB has rank 1 in the standard split representation.
- The lattices lie in ω², not ω⁻².

**Source contracts.**

- [R18.2/yz](#r18-2-yz), Proposition 5.4 and Corollary 5.5, pp.575–576: Determinant cancellation with E31–E32 corrected scope.

**Closure obligations.** Ramified bridge determinant; Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.3"></a>

## R18.3. Definite quaternionic forms

These declarations supply finite integral modules and geometric auxiliary-level control. The norm branch is removed before cuspidal Jacquet–Langlands. All averaging denominators, factorial pairings, isotropy exponents and dyadic sign choices are stated explicitly; arbitrary coefficient representations do not inherit the KW assertions without their lattice hypotheses.

<a id="r18.3-definite-class-set"></a>

### Definite quaternionic class set

`HilbertModularVarietiesAndShimuraCurves:R18.3/definite-class-set` · definition · `TauCeti.Blueprint.Quaternionic.DefiniteClassSet`

Specialize the existing double-coset quotient to C_U=D×\D_f×/(U A_F,f×). Its effective stabiliser at t is Γ_t=(U A_F,f×∩t⁻¹D×t)/F×. Use the quotient by the rational centre before asserting finiteness. Changing t by dtu z transports the stabiliser and its coefficient action by conjugation.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.

**Proof route.**

1. Instantiate DoubleCoset.Quotient using the adelic centre times U as right subgroup.
2. Use finiteness of the definite quaternion ideal-class set modulo the centre.
3. Compute isotropy of right level action and divide out F×; verify coefficient action is well-defined.

**Prerequisites.** `mathlib:DoubleCoset.Quotient`, `mathlib:DoubleCoset.eq`, `AdelicAlgebraicGroups:AA.5`.

**API.**

- `DefiniteClassSet.quotient` (compatibility): The carrier is DoubleCoset.Quotient D× (U A_F,f×).
- `DefiniteClassSet.finite` (instance): For definite D and admissible U the class set is finite.
- `DefiniteClassSet.stabiliser` (data): At t the acting finite group is (UZ∩t⁻¹D×t)/F×.
- `DefiniteClassSet.changeRepresentative` (equivalence): Equivalent representatives give conjugate stabilisers and canonically transported invariant modules.

**Unit tests.**

- `DefiniteClassSet.centralUnits` (non-example): For a real quadratic F, quotienting by F× removes its infinite central units; the unquotiented arithmetic group is not finite.
- `DefiniteClassSet.trivialOrbit` (degenerate): A class with Γ_t=1 contributes exactly W, with no averaging denominator.
- `DefiniteClassSet.doubleCosetEquality` (compatibility): Two representatives agree exactly when t′=dtu z for d∈D×, u∈U and z∈A_F,f×.

**Acceptance checks.**

- C_U is finite; Γ_t is finite even though the undiscarded arithmetic central units need not be.
- At a representative with trivial effective stabiliser the coefficient summand is all W.

**Uses.**

- KW §7.2 and Lemma 7.4: Computes isotropy, coefficient invariants and the free diamond action.
- Taylor §1: Indexes the weighted pairing.

**Source contracts.**

- [R18.2/kw](#r18-2-kw), §7 (opening), pp.57–59, display (5); §7.2, pp.61–62: Central quotient and finite isotropy, used in every integral assertion.

**Planet.** Definite quaternionic class set.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.3-quaternion-weight"></a>

### Quaternionic integral weights

`HilbertModularVarietiesAndShimuraCurves:R18.3/quaternion-weight` · construction · `TauCeti.Blueprint.Quaternionic.QuaternionWeight`

Specialize AF.4 coefficient lattices to parallel weight k≥2: W_k=⊗_{σ:F→E} Sym^{k−2} O², using chosen splittings at v|p and the restricted U_p action. The centre acts by N_{F/Q}(z)^{k−2}; hence ψ near p must have inverse this action. For p=2 KW uses k=2. At a dyadic ramified division place use its discrete order-two quotient and one of the two sign characters, rather than a nonexistent GL₂ splitting.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- p unramified in F for the KW weight construction; D split at each active p-adic weight place.

**Proof route.**

1. Import integral symmetric powers and tensor coefficient lattices with their semigroup actions.
2. Check the product of central scalar powers and its inverse character.
3. For a division dyadic factor distinguish maximal compact from the full D_v× and its sign extension.

**Prerequisites.** `AutomorphicFormsOnReductiveGroups:AF.4`, `mathlib:Representation`.

**API.**

- `QuaternionWeight.rank` (structure): Parallel weight k over a degree-d field has rank (k−1)^d.
- `QuaternionWeight.centralAction` (characterisation): A scalar z acts by N(z)^{k−2}.
- `QuaternionWeight.baseChange` (functoriality): Scalar extension commutes with the tensor of symmetric-power lattices.
- `QuaternionWeight.weightTwo` (compatibility): At k=2 the lattice is the trivial rank-one O-representation.

**Unit tests.**

- `QuaternionWeight.weightTwoRank` (degenerate): For any d, weight 2 has rank 1.
- `QuaternionWeight.quadraticWeightFour` (computation): For d=2 and k=4 the rank is 9.
- `QuaternionWeight.factorialObstruction` (non-example): At p=2 and k=4 the natural pairing on Sym²(Z₂²) pairs X² with Y² to ±2 and XY with itself to ±1, so its Gram matrix has determinant ±4 and it is not perfect over Z₂.

**Acceptance checks.**

- Weight 2 has rank one with trivial algebraic action.
- For degree d, parallel weight k has coefficient rank (k−1)^d.
- The invariant perfect pairing requires factorials through k−2 to be units.

**Uses.**

- KW Lemmas 7.1–7.4 and Taylor §1: Fixes the integral coefficient action needed for base change, isotropy and pairing.
- R18.4 coefficient comparison: Matches the algebraic representation after checking dual and central-character conventions.

**Source contracts.**

- [R18.2/kw](#r18-2-kw), §7 (opening), pp.58–59: Integral coefficient module and dyadic convention.
- [R18.2/taylor](#r18-2-taylor), §1, pp.741–742: The natural differential pairing on Sym^{k−2} pairs monomials with factorial coefficients; it is perfect only in the stated weight range.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.3-definite-specialisation"></a>

### Fixed-central-character algebraic forms

`HilbertModularVarietiesAndShimuraCurves:R18.3/definite-specialisation` · comparison · `TauCeti.Blueprint.Quaternionic.DefiniteSpecialisation`

Use the extended AF.5 carrier, not a new generic definition, for functions f:D_f×→W_A satisfying f(dgu)=τ(u)⁻¹f(g), f(gz)=ψ(z)f(g). Evaluation at class representatives identifies S_{τ,ψ}(U,A) with ⊕_{t∈C_U} W_A^{Γ_t}. This requires AF.5 to admit the adelic central quotient: its current discrete-centre hypothesis does not cover O_F× of positive rank.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- A is an O-algebra; τ and ψ extend by scalars.

**Proof route.**

1. Request the fixed-central-character version of AF.5 and specialize D×.
2. At each t compute its effective stabiliser action using τ and ψ.
3. Evaluate and reconstruct equivariant functions; show independence of representatives.

**Prerequisites.** [R18.3/definite-class-set](#r18.3-definite-class-set), [R18.3/quaternion-weight](#r18.3-quaternion-weight), `AutomorphicFormsOnReductiveGroups:AF.5/algebraic-modular-forms`, `AutomorphicFormsOnReductiveGroups:AF.5/algebraic-modular-forms-structure`.

**Acceptance checks.**

- For τ=1, ψ=1 and trivial stabilisers this is A^{C_U}.
- Replacing Γ_t by the full group containing F× is not the finite-invariants formula.

**Source contracts.**

- [R18.2/kw](#r18-2-kw), §7 (opening), pp.58–59, display (5): Specialization of shared carrier; extension of generic supplier is explicit.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.3-neatness-base-change"></a>

### Neat-level reduction and base change

`HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change` · theorem · `TauCeti.Blueprint.Quaternionic.NeatnessBaseChange`

If every effective Γ_t has order invertible in O, S_{τ,ψ}(U,O) is finite free and base change to every O-algebra A identifies S(U,O)⊗A with S(U,A). Thus reduction modulo the uniformizer is surjective. Taylor Lemma 1.1 ensures this when p>3 is unramified in F in its stated compact definite setup. For p=2 or 3 use a specified auxiliary torsion-free level, not the automatic p>3 argument.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- All stabiliser orders prime to p, or an explicitly constructed auxiliary effective torsion-free level.

**Proof route.**

1. Apply the averaging idempotent |Γ_t|⁻¹Σγ to each finite free coefficient module.
2. Its image is a direct summand and scalar extension commutes with the idempotent.
3. Use the exact neatness source hypotheses; request the degree/auxiliary-level argument referenced as Khare Lemma 2.2.

**Prerequisites.** [R18.3/definite-specialisation](#r18.3-definite-specialisation), `mathlib:Module.Free`, `mathlib:Module.Finite`.

**Acceptance checks.**

- Finiteness of Γ_t alone is insufficient in residue characteristic dividing its order.
- For a cyclic group of order p, averaging is unavailable over Z_p.

**Source contracts.**

- [R18.2/taylor](#r18-2-taylor), Lemma 1.1 and Corollary 1.2, pp.738–739: Automatic prime-to-l isotropy with exact restrictions.
- [R18.2/kw](#r18-2-kw), §8.2, p.73; §8.4, p.77: Auxiliary smallness is geometric, not a modularity input.

**Planet.** Neat-level base change.

**Closure obligations.** Khare Lemma 2.2 exact statement; Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.3-integral-pairing"></a>

### Perfect quaternionic pairing

`HilbertModularVarietiesAndShimuraCurves:R18.3/integral-pairing` · theorem · `TauCeti.Blueprint.Quaternionic.IntegralPairing`

For a perfect τ-pairing satisfying the determinant/central-character similitude law and prime-to-p effective stabilisers, the sum over class representatives, weighted by |Γ_t|⁻¹ and ψ(Nrd t)⁻¹, is a perfect O-pairing on S(U,O). For the standard differential pairing on Sym^{k−2}, require its factorial entries to be units (Taylor uses 2≤k≤p+1). The adjoint of [UgU] is ψ(Nrd g)[Ug⁻¹U] with the matching coefficient action.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- A perfect integral coefficient pairing and unit isotropy denominators; Taylor weight range only where invoked.

**Proof route.**

1. Use the invariant direct-summand decomposition and average the coefficient pairing.
2. Check representative independence using the similitude factor.
3. Reverse the finite double-coset correspondence to compute its adjoint.

**Prerequisites.** [R18.3/neatness-base-change](#r18.3-neatness-base-change), `AutomorphicFormsOnReductiveGroups:AF.4`, `AutomorphicFormsOnReductiveGroups:AF.5`.

**Acceptance checks.**

- At k=p+2 the factorial pairing can degenerate modulo p.
- A one-point class set with trivial coefficient and stabiliser has pairing ab.

**Source contracts.**

- [R18.2/taylor](#r18-2-taylor), §1, pp.741–742: Weighted integral pairing and inverse-double-coset adjoint.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.3-split-hecke-normalisation"></a>

### Split Hecke normalization

`HilbertModularVarietiesAndShimuraCurves:R18.3/split-hecke-normalisation` · comparison · `TauCeti.Blueprint.Quaternionic.SplitHeckeNormalisation`

At v∉S with D_v=M₂(F_v), U_v=GL₂(O_v) and unramified coefficients, specialize AF.5 double-coset Hecke action: T_v=[U diag(π_v,1)U], S_v=[U diag(π_v,π_v)U]=ψ(π_v). The arithmetic Satake polynomial is X²−T_vX+q_vS_v. All change-of-level and commuting away-place actions are imported and checked with these local and coefficient conventions.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.

**Proof route.**

1. Compute the q_v+1 single cosets in the spherical T_v double coset.
2. Use the generic semigroup coefficient extension and Hecke convolution.
3. Match the arithmetic Satake normalization to R17.3.

**Prerequisites.** [R18.3/definite-specialisation](#r18.3-definite-specialisation), `AutomorphicFormsOnReductiveGroups:AF.5`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/split-hecke`.

**Acceptance checks.**

- S_v is the scalar character, not q_v times it.
- For q_v=p the determinant specialization is p S_v.

**Source contracts.**

- [R18.2/kw](#r18-2-kw), §7 (opening), p.59; §7.4, p.65: The polynomial normalization used by the eigenroot and residual ideal.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.3-norm-branch"></a>

### Norm-factor forms and Eisenstein support

`HilbertModularVarietiesAndShimuraCurves:R18.3/norm-branch` · theorem · `TauCeti.Blueprint.Quaternionic.NormBranch`

For parallel weight 2 and compatible finite character, the forms factoring through Nrd are exactly the SL₂-invariant local branch under the strong-approximation hypotheses of KW §7.1. Their good-place Hecke eigenvalues give sums of characters, so their localization at a non-Eisenstein maximal ideal vanishes. Following KW §7, a maximal ideal m of T_ψ(U) is Eisenstein if T_v−2 and S_v−1 lie in m for all but finitely many places v split in a fixed finite abelian extension of F; non-Eisenstein means not Eisenstein. No Galois representation is constructed here.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- Weight 2; strong approximation for D¹ at a chosen split finite place.

**Proof route.**

1. Translate the invariance into constancy on norm fibres by strong approximation.
2. Compute T_v and S_v on a norm character.
3. Use a good-place operator outside the ideal to annihilate the localized branch.

**Prerequisites.** [R18.3/split-hecke-normalisation](#r18.3-split-hecke-normalisation), `AdelicAlgebraicGroups:AA.5`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`.

**Acceptance checks.**

- The norm character branch must be excluded from global Jacquet–Langlands.
- A residual absolutely irreducible system supplied by R19 yields a non-Eisenstein ideal.

**Source contracts.**

- [R18.2/kw](#r18-2-kw), §7 (opening), pp.59–60: definition of Eisenstein maximal ideals and proof of Lemma 7.1: Character branch and geometric support of degeneracy kernels.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.3-definite-degeneracy"></a>

### Definite Ihara degeneracy map

`HilbertModularVarietiesAndShimuraCurves:R18.3/definite-degeneracy` · theorem · `TauCeti.Blueprint.Quaternionic.DefiniteDegeneracy`

At a finite place w∉Σ (so D is split at w), with w added to S for the Hecke algebra, compact U with hyperspecial U_w and trivial local coefficient action, the degeneracy map S(U,A)²→S(U₀(w),A), (f₁,f₂)↦f₁+diag(1,π_w)f₂, has kernel supported on the norm-factor Eisenstein branch. Hence it is injective after non-Eisenstein localization, for the coefficient rings and coefficient extensions in KW Lemma 7.1. This is the definite version; an integral indefinite Ihara theorem is a separate supplier request.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- D split at w, U_w=GL₂(O_w); the action by diag(1,π_w) is defined on coefficients.

**Proof route.**

1. A kernel relation forces invariance under the two conjugate maximal compacts.
2. They generate the local SL₂ group.
3. Apply strong approximation and the norm-branch support theorem.

**Prerequisites.** [R18.3/norm-branch](#r18.3-norm-branch), `AutomorphicFormsOnReductiveGroups:AF.5`.

**Acceptance checks.**

- No automorphy-lifting theorem or R23 input enters this proof.
- Non-Eisenstein localization is necessary.

**Source contracts.**

- [R18.2/kw](#r18-2-kw), §7 (opening), Lemma 7.1, p.60: Precise definite degeneracy input for TW control.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.3-definite-jl"></a>

### Definite Jacquet–Langlands realization

`HilbertModularVarietiesAndShimuraCurves:R18.3/definite-jl` · comparison · `TauCeti.Blueprint.Quaternionic.DefiniteJl`

Apply R17.3 global Jacquet–Langlands to the characteristic-zero cuspidal definite module after removing χ∘Nrd. At split finite places the Hecke eigensystems agree; at ramified places the GL₂ component is discrete series. Parallel Sym^{k−2} corresponds to holomorphic discrete series of weight k at every real place. Rational realization requires actual compatible coefficient-field models, not merely equality of rationality fields.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- Characteristic zero; exclude one-dimensional norm characters and fix embeddings/splittings.

**Proof route.**

1. Decompose the finite-level module in automorphic representations using the generic spectral supplier.
2. Apply global-jl and definite-infinity from R17.3.
3. Use its rational-models comparison only after the coefficient field and descent obstruction have been handled.

**Prerequisites.** [R18.3/definite-specialisation](#r18.3-definite-specialisation), [R18.3/norm-branch](#r18.3-norm-branch), `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/definite-infinity`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`.

**Acceptance checks.**

- Weight-2 norm forms have no cuspidal GL₂ transfer.
- Integral lattice equality is not implied by a complex JL bijection.

**Source contracts.**

- [R18.2/kw](#r18-2-kw), §7 (opening), pp.59–60: Owned transfer imported; this node is its quaternionic finite-level application.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.3-isotropy-exponent"></a>

### Quaternionic isotropy exponent bound

`HilbertModularVarietiesAndShimuraCurves:R18.3/isotropy-exponent` · theorem · `TauCeti.Blueprint.Quaternionic.IsotropyExponent`

For an auxiliary split place w∤p with hyperspecial local control, write N_w=|GL₂(k_w)|. The Sylow-p subgroups of all Γ_t have exponent dividing 2N_w in the compact-level case and 4N_w in KW’s allowed noncompact dyadic division-factor case. The norm maps to ((A_F,f×)²V∩F×)/(F×)²; this final map need not be surjective. Its target has exact sequence 0→O_F×/(O_F×)²→target→Cl(O_F)[2]→0.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- U,V and the distinguished w satisfy KW §7.2; in the noncompact case U⁰ is used for local compactness.

**Proof route.**

1. Control the norm-one subgroup by injective reduction at w and divide by ±1.
2. Bound the norm-square quotient by its unit/class-group two-torsion sequence.
3. Combine exponents, distinguishing p=2 and the extra elementary-two level quotient.

**Prerequisites.** [R18.3/definite-class-set](#r18.3-definite-class-set), `AdelicAlgebraicGroups:AA.5`.

**Acceptance checks.**

- Do not promote the first norm sequence to short exact at its right end.
- For odd p the extra factors of 2 do not affect the p-primary exponent.

**Source contracts.**

- [R18.2/kw](#r18-2-kw), §7.2, displays (6)–(7), pp.61–62: Uniform p-isotropy bound with compact/noncompact distinction.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.3-base-change-annihilator"></a>

### Base-changed local characters annihilate isotropy

`HilbertModularVarietiesAndShimuraCurves:R18.3/base-change-annihilator` · theorem · `TauCeti.Blueprint.Quaternionic.BaseChangeAnnihilator`

Let F′/F be totally real with w split and impose KW Lemma 7.3 residue-field divisibility at the chosen Iwahori places. Choose χ₀ of p-power order equal to the p-part of 2p(4N_w), and χ=χ₀^{4N_w}. Then χ kills every effective stabiliser; it is nontrivial, and when p=2 has order 4. Its local action is through the ratio a/d of the triangular reduction. This statement concerns a given F′ and local characters; choosing global auxiliary fields is R23 work.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- The prescribed residue fields admit χ₀, and all isotropy exponents divide 4N_w.

**Proof route.**

1. Compute the norm-ratio image of a stabiliser using the exponent bound.
2. Raise the local character to 4N_w and verify it vanishes on that image.
3. Check its remaining p-power order, including dyadic order four.

**Prerequisites.** [R18.3/isotropy-exponent](#r18.3-isotropy-exponent).

**Acceptance checks.**

- A character whose order only divides the isotropy exponent is not sufficient.
- At p=2 the resulting character has order 4 rather than 2.

**Source contracts.**

- [R18.2/kw](#r18-2-kw), §7.3, Lemma 7.3 and its proof, pp.62–63: Field/base-change and residue divisibility retained.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.3-tw-level"></a>

### Quaternionic Taylor–Wiles level

`HilbertModularVarietiesAndShimuraCurves:R18.3/tw-level` · construction · `TauCeti.Blueprint.Quaternionic.QuaternionTWLevel`

For any finite Q away S with D split, q_v≡1 mod p^n, and fixed p-power N divisible by all Sylow-p isotropy exponents, let Δ′_v be the maximal p-quotient of k_v× and Δ_v=Δ′_v/Δ′_v[N]. Put U′_v=Iwahori and U_v=ker(a/d:U′_v→Δ_v), with unchanged factors away Q. Then U′_Q/U_Q=Δ_Q=∏_vΔ_v. The quotient kills N-torsion; it is not the quotient by Nth powers.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- N and Q are inputs; no existence or selection of Taylor–Wiles primes is claimed.

**Proof route.**

1. Use the cyclic residue-unit group to construct Δ′ and its N-torsion quotient.
2. Define the ratio on invertible triangular reductions and its open normal kernel.
3. Identify the product quotient and lifts diag(h,1).

**Prerequisites.** [R18.3/isotropy-exponent](#r18.3-isotropy-exponent), `mathlib:QuotientGroup.mk`, `AutomorphicFormsOnReductiveGroups:AF.5`.

**API.**

- `QuaternionTWLevel.diamondGroup` (data): Δ_Q is the product of the maximal residue p-quotients modulo their N-torsion.
- `QuaternionTWLevel.levelQuotient` (equivalence): U′_Q/U_Q≅Δ_Q via the product diagonal ratios.
- `QuaternionTWLevel.normal` (structure): U_Q is open normal in U′_Q.
- `QuaternionTWLevel.changeQ` (functoriality): For Q′⊂Q the level and diamond quotient forget the factors Q\Q′.

**Unit tests.**

- `QuaternionTWLevel.empty` (degenerate): At Q=∅, Δ_Q=1 and U_Q=U.
- `QuaternionTWLevel.cyclicOrder` (computation): For Δ′=C₈ and N=2, Δ=C₄.
- `QuaternionTWLevel.torsionNotPowers` (non-example): For Δ′=C₈ and N=2 the quotient by Nth powers has order 2, and is the wrong quotient.

**Acceptance checks.**

- If |Δ′_v|≤N then Δ_v is trivial.
- If Δ′_v=C_{p^a} and N=p^b with b≤a, |Δ_v|=p^{a−b}.

**Uses.**

- KW Lemma 7.4 and Corollary 7.5: Produces the free diamond action and localized control module.
- GL2ModularityLifting:R22.2: R22 chooses primes and applies this geometric level theorem; it does not own it.

**Source contracts.**

- [R18.2/kw](#r18-2-kw), §7.4, p.63 (auxiliary levels before Lemma 7.4): Geometric auxiliary level for arbitrary admissible Q.

**Planet.** Quaternionic Taylor–Wiles level.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.3-tw-stabilisers"></a>

### Stabiliser equality at Taylor–Wiles level

`HilbertModularVarietiesAndShimuraCurves:R18.3/tw-stabilisers` · theorem · `TauCeti.Blueprint.Quaternionic.TwStabilisers`

For the level above, every character of Δ_Q kills the effective isotropy at U′_Q; the effective stabilisers at U_Q and U′_Q agree. Consequently Δ_Q acts freely on the class-set fibres C_{U_Q}→C_{U′_Q}. The invariant coefficient modules attached to all twists have equal O-rank; modulo the uniformizer their identifications are Hecke-equivariant, while arbitrary integral twist identifications need not be.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- N kills all p-isotropy exponents; Δ_Q is the quotient by Δ′[N].

**Proof route.**

1. Map stabilisers to residue p-quotients and use their exponent bound.
2. Their images vanish in Δ_Q, so level reduction preserves isotropy.
3. Compare coefficient invariants and free class-set fibres; distinguish integral and residual Hecke compatibility.

**Prerequisites.** [R18.3/tw-level](#r18.3-tw-level), [R18.3/definite-specialisation](#r18.3-definite-specialisation).

**Acceptance checks.**

- The freeness of the diamond action follows from isotropy annihilation, not just finiteness.
- An arbitrary O-linear twisted-module identification is not claimed to preserve Hecke operators.

**Source contracts.**

- [R18.2/kw](#r18-2-kw), §7.4, proof of Lemma 7.4, display (8), pp.64–65: The geometric mechanism behind group-ring freeness.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.3-tw-freeness"></a>

### Integral diamond freeness

`HilbertModularVarietiesAndShimuraCurves:R18.3/tw-freeness` · theorem · `TauCeti.Blueprint.Quaternionic.TwFreeness`

Under KW Lemma 7.4’s coefficient and level hypotheses, S_{τ,ψ}(U_Q,O) is finite free over O[Δ_Q], of rank rank_O S_{τ,ψ}(U′_Q,O). On each free Δ_Q-orbit, the common finite-free invariant coefficient summand gives a regular O[Δ_Q] factor. The localized non-Eisenstein direct factors inherit freeness when the Hecke idempotent is Δ_Q-equivariant.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- Invariant coefficient summands finite free as established in the KW setting; an arbitrary representation without this condition is not covered.

**Proof route.**

1. Use the free orbit decomposition and equal stabiliser invariant modules.
2. Identify each orbit module with O[Δ_Q]⊗_O W^{Γ_t}.
3. Use locality of the p-group algebra over the local O-ring for finite projective localized factors.

**Prerequisites.** [R18.3/tw-stabilisers](#r18.3-tw-stabilisers), `mathlib:MonoidAlgebra`, `mathlib:Module.Free`.

**Acceptance checks.**

- The rank is measured at U′_Q, not multiplied again by |Δ_Q|.
- The O-rank at U_Q equals |Δ_Q| times the group-ring rank.

**Source contracts.**

- [R18.2/kw](#r18-2-kw), §7.4, Lemma 7.4(2), p.64 (proof p.65): Ownership R18.3; no prime-choice or patching input.

**Planet.** Δ_Q-freeness in presence of isotropy.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.3-tw-localised-control"></a>

### Localized eigenroot and coinvariant control

`HilbertModularVarietiesAndShimuraCurves:R18.3/tw-localised-control` · theorem · `TauCeti.Blueprint.Quaternionic.TwLocalisedControl`

Given a non-Eisenstein residual system unramified at Q with two distinct Frobenius eigenvalues α_v,β_v, choose the Hensel lift A_v of α_v in X²−T_vX+q_vψ(π_v). Localizing at U_v−α_v selects a finite-free O[Δ_Q] module with rank rank_O S(U,O)_m; its Δ_Q-coinvariants identify with S(U,O)_m via ξ_v(f)=A_vf−diag(1,π_v)f. The Steinberg exclusion used in KW’s proof requires the stated R19 local–global compatibility; geometric Lemma 7.4 is independent of that input.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- Residual irreducibility/non-Eisenstein localization; q_v≡1 mod p, distinct α_v,β_v; actual characteristic-zero local–global compatibility supplied.

**Proof route.**

1. Apply definite degeneracy injectivity and the Hensel eigenroot factorization.
2. Use R19 compatibility to exclude the unwanted Steinberg branch at Q.
3. Take the free Δ_Q-equivariant summand and prove the coinvariant/rank comparison.

**Prerequisites.** [R18.3/tw-freeness](#r18.3-tw-freeness), [R18.3/definite-degeneracy](#r18.3-definite-degeneracy), `AutomorphicGaloisRepresentations:R19.2`.

**Acceptance checks.**

- Repeated residual roots do not give the stated direct-summand projector.
- At coinvariants diamonds act as 1 and U_v acts as A_v.

**Source contracts.**

- [R18.2/kw](#r18-2-kw), §7.4, construction of ξv and Corollary 7.5 with its proof, pp.65–66: Compatibility-dependent refinement separated from geometric freeness.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.3-dyadic-norm-twist"></a>

### Dyadic reduced-norm twist

`HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-norm-twist` · construction · `TauCeti.Blueprint.Quaternionic.DyadicNormTwist`

For p=2 and a given quadratic character χ:G_n/2G_n→O×, split at S and infinity and unramified outside Q, with 2^n>N ensuring χ(Nrd U_Q)=1, define T_χf(g)=χ(Nrd g)f(g). This O-linear involution preserves the weight, level and central character because Nrd(z)=z². Existence of χ and selection of Q belong to R22/R04, not to this construction.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- p=2; χ²=1; prescribed χ is trivial on the level norms.

**Proof route.**

1. Multiply the fixed-central-character functions by χ∘Nrd.
2. Check left D× invariance, level invariance and the square on the centre.
3. Use χ²=1 to obtain the inverse and verify reduction χ≡1 mod the dyadic maximal ideal.

**Prerequisites.** [R18.3/tw-level](#r18.3-tw-level), [R18.3/definite-specialisation](#r18.3-definite-specialisation), `mathlib:LinearEquiv`.

**API.**

- `DyadicNormTwist.apply` (projection): T_χf(g)=χ(Nrd g)f(g).
- `DyadicNormTwist.involutive` (characterisation): T_χ∘T_χ=id for χ²=1.
- `DyadicNormTwist.centralCharacter` (compatibility): The central character remains ψ since χ(z²)=1.
- `DyadicNormTwist.reduction` (compatibility): At residue characteristic two the reduction of T_χ is the identity.

**Unit tests.**

- `DyadicNormTwist.trivial` (degenerate): The trivial χ gives the identity.
- `DyadicNormTwist.scalar` (computation): A central scalar z contributes χ(z²)=1.
- `DyadicNormTwist.nonquadratic` (non-example): An order-four character with χ(z)=i changes the scalar action by −1 and does not preserve ψ.

**Acceptance checks.**

- Quadratic twisting preserves ψ, while a general character changes it by χ².
- Reduction mod the uniformizer is the identity on the same residual module.

**Uses.**

- KW Proposition 7.6 and GL2ModularityLifting:R22.2: Transports auxiliary-level modules under the dyadic character action without choosing the primes.

**Source contracts.**

- [R18.2/kw](#r18-2-kw), §7.5, p.66, before Proposition 7.6: Geometric dyadic involution, owned by R18.3.

**Planet.** Dyadic norm twist.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.3-dyadic-hecke-twist"></a>

### Dyadic twist and Hecke transport

`HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-hecke-twist` · theorem · `TauCeti.Blueprint.Quaternionic.DyadicHeckeTwist`

For the norm twist, T_v and U_v are multiplied by χ(π_v), S_v is fixed, and (f|⟨h⟩)_χ=χ(h)⁻¹(f_χ|⟨h⟩). Since χ≡1 modulo the dyadic uniformizer, the residual maximal ideal is preserved. These equations transport the localized Taylor–Wiles modules and their ranks and coinvariants as in Proposition 7.6, conditional on the given auxiliary character.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- The dyadic norm-twist hypotheses and compatible local diamond lifts.

**Proof route.**

1. Move the norm multiplier through each finite coset sum.
2. Use norm of diag(π,1), scalar diag(π,π), and diag(h,1).
3. Reduce the units modulo the dyadic maximal ideal and transport the localized free module.

**Prerequisites.** [R18.3/dyadic-norm-twist](#r18.3-dyadic-norm-twist), [R18.3/split-hecke-normalisation](#r18.3-split-hecke-normalisation), [R18.3/tw-localised-control](#r18.3-tw-localised-control).

**Acceptance checks.**

- The diamond factor is inverse on the displayed left side.
- S_v is fixed because its norm is π_v².

**Source contracts.**

- [R18.2/kw](#r18-2-kw), Proposition 7.6, pp.66–67: Hecke and diamond formulas with the scalar-square normalization.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.3-dyadic-sign-extension"></a>

### Dyadic division-place sign extensions

`HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-sign-extension` · theorem · `TauCeti.Blueprint.Quaternionic.DyadicSignExtension`

At a dyadic division place with U_v=D_v×, its maximal compact U_v⁰ has quotient U_vF_v×/(U_v⁰F_v×) of order two. For weight two, each choice of sign extends the compact coefficient action; over characteristic two the two reductions agree. With a set Σ₀ of such places there are 2^{|Σ₀|} sign choices. Compactness-based arguments must use U⁰ and retain this quotient.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- KW noncompact variant allowed only at the specified dyadic division factors; weight two.

**Proof route.**

1. Use the local valuation on the division algebra and its centre-square valuation.
2. Identify the effective quotient and its two characters.
3. Take products and reduce signs in characteristic two.

**Prerequisites.** [R18.3/quaternion-weight](#r18.3-quaternion-weight), `GL2AutomorphicRepresentationsAndTransfer:R16.2`.

**Acceptance checks.**

- Over O the signs +1 and −1 differ; over k of characteristic two they coincide.
- The full U_v is not a compact open subgroup.

**Source contracts.**

- [R18.2/kw](#r18-2-kw), §7 (opening), pp.58–59: Noncompact level convention and its coefficient extensions.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.3-residual-hecke-ideal"></a>

### Residual quaternionic Hecke ideal

`HilbertModularVarietiesAndShimuraCurves:R18.3/residual-hecke-ideal` · construction · `TauCeti.Blueprint.Quaternionic.ResidualHeckeIdeal`

In the CDN §4.1.3 setup, let T^S=O[T_v,S_v:v∉S] be the shared abstract good-place Hecke algebra. Given a continuous residual ρ̄:G_E→GL₂(k) unramified outside S, evaluate T_v↦tr ρ̄(Frob_v), S_v↦q_v⁻¹ det ρ̄(Frob_v), and coefficients by O→k. Define m_ρ̄ as the kernel. The coefficient reduction is surjective, hence this is a maximal ideal. Factoring this evaluation through the acting quotient Hecke algebra requires the eigen-system existence theorem supplied by R19.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- For the CDN application p>2, local F=Q_p, global E even degree with p completely split, D₀ definite and finite-unramified; keep E distinct from the earlier auxiliary CM field.
- q_v is a unit in k; arithmetic Frobenius convention fixed.

**Proof route.**

1. Specialize the generic polynomial Hecke algebra and evaluate its two generators.
2. Use surjective coefficient reduction for maximality of the kernel.
3. Request Galois-to-acting-Hecke compatibility from R19; do not infer it from a formal evaluation.

**Prerequisites.** [R18.3/split-hecke-normalisation](#r18.3-split-hecke-normalisation), `AutomorphicFormsOnReductiveGroups:AF.5`, `AutomorphicGaloisRepresentations:R19.2`, `mathlib:MvPolynomial.eval₂Hom`, `mathlib:RingHom.ker`, `mathlib:RingHom.ker_isMaximal_of_surjective`.

**API.**

- `ResidualHeckeIdeal.evalT` (simp): T_v evaluates to tr ρ̄(Frob_v).
- `ResidualHeckeIdeal.evalS` (simp): S_v evaluates to q_v⁻¹ det ρ̄(Frob_v).
- `ResidualHeckeIdeal.maximal` (structure): Surjective O→k makes the evaluation kernel maximal.
- `ResidualHeckeIdeal.actingFactor` (compatibility): When R19 supplies the eigen-system, the abstract evaluation factors through the acting Hecke quotient.

**Unit tests.**

- `ResidualHeckeIdeal.normThree` (computation): In k=F₇, q=3 and determinant=6 give S=2.
- `ResidualHeckeIdeal.scalarDeterminant` (compatibility): The arithmetic polynomial has constant term qS=det ρ̄(Frob).
- `ResidualHeckeIdeal.nonsurjective` (non-example): The kernel of Z→Q is zero and not maximal; surjectivity cannot be dropped.

**Acceptance checks.**

- For q_v=3, trace=5 and determinant=6, S_v evaluates to 2, not 6 (in residue characteristic not 2 or 3).
- An evaluation without surjective coefficient image need not have maximal kernel.

**Uses.**

- CDN §4.1.3 and §4.2: Localizes quaternionic automorphic modules at the residual system.
- R22 patching: Provides the fixed residual Hecke ideal with the arithmetic normalization.

**Source contracts.**

- [R18.2/cdn23](#r18-2-cdn23), §4.1.3, pp.48–49: Exact residual dictionary; the inverse norm is essential.

**Planet.** Residual Hecke ideal.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.4"></a>

## R18.4. Cohomology and Hecke correspondences

The generic automorphic coefficient and cohomology constructions are imported. The quaternionic specializations retain duals, Tate twists, residual vanishing assumptions and actual change-level correspondences. Characteristic-zero eigensystem comparison does not identify the entire definite function space with the entire curve cohomology.

<a id="r18.4-quaternion-local-systems"></a>

### Quaternionic algebraic local systems

`HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-local-systems` · construction · `TauCeti.Blueprint.Quaternionic.QuaternionLocalSystem`

Specialize the shared automorphic local-system construction to X_U and an algebraic B×-representation W. On each complex component Γ\H, the Betti system is (H×W)/Γ; on the canonical curve the étale O/l^n systems descend the matching finite-level torsors, compatibly in n. Identify their pullbacks to the complex analytic curve using the fixed coefficient/dual convention. At split quaternionic p-level the rank-two Morita factor of H supplies the standard geometric representation of weight one. Parallel automorphic weight k uses its tensor of Sym^{k−2} constituents; automorphic weight two has the trivial rank-one coefficient system.

**Hypotheses.**

- B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary.
- O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.

**Proof route.**

1. Import the generic coefficient-lattice and local-system descent API.
2. Compute the quaternionic arithmetic action and compare the finite torsor descriptions.
3. Apply generic Betti–étale comparison to the coefficient systems, retaining all embeddings and duals.

**Prerequisites.** `AutomorphicFormsOnReductiveGroups:AF.4/coefficient-lattices`, `ArithmeticLocallySymmetricSpaces:ALS.1`, `tauceti:TauCeti.LocalCoefficientSystem`, [R18.2/quaternion-pdiv-tower](#r18.2-quaternion-pdiv-tower).

**API.**

- `QuaternionLocalSystem.betti` (projection): On Γ\H the system is the Γ-associated W-bundle.
- `QuaternionLocalSystem.etaleReduction` (data): Reduction modulo l^n is the descended finite-level torsor coefficient system.
- `QuaternionLocalSystem.changeLevel` (functoriality): Level pullback identifies the corresponding local systems.
- `QuaternionLocalSystem.trivial` (compatibility): Trivial W gives the constant local system in both realizations.

**Unit tests.**

- `QuaternionLocalSystem.constant` (degenerate): The trivial rank-one representation gives the constant O-system.
- `QuaternionLocalSystem.rank` (computation): A rank-r lattice gives fibre rank r, not r times the covering degree.
- `QuaternionLocalSystem.monodromy` (non-example): On a loop acting by −1 on W, parallel transport is −1; the constant system is wrong when 2 is invertible.

**Acceptance checks.**

- At trivial weight the Betti system is the constant O-system.
- Fundamental-groupoid functors exist in Tau Ceti; their étale realization and cohomology do not follow from that definition.

**Uses.**

- R18.4 finite cohomology and R19.2: Defines coefficient systems before cohomology, purity and Galois construction.
- CDN20 §5.2.1: Weight-two trivial coefficient realization is the special case used in the tower.

**Source contracts.**

- [R18.2/carayol](#r18-2-carayol), §1.4, pp.159–160; §4.4, pp.186–188: Quaternionic coefficient sheaf and its canonical descent.

**Planet.** Quaternionic coefficient systems.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.4-finite-cohomology"></a>

### Quaternionic finite-level cohomology

`HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology` · construction · `TauCeti.Blueprint.Quaternionic.QuaternionCohomology`

Apply the imported cohomology functors to define M_U=H¹_et(X_U,Fbar,L_O) and M_U^B=H¹_B(X_U(C),L_O), with continuous G_F action on the étale side and finite O-modules. The good-place and change-level Hecke correspondences act by coefficient transport followed by pullback and trace. The Betti–étale comparison is Hecke-equivariant; integral O-freeness is a separate theorem, not part of the definition.

**Hypotheses.**

- B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary.
- O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.

**Proof route.**

1. Import étale/Betti finiteness, coefficient comparison and pull-push for finite correspondences.
2. Specialize all functors to the canonical quaternionic curve.
3. Check compositions against generic Hecke convolution and away-place commutativity.

**Prerequisites.** [R18.4/quaternion-local-systems](#r18.4-quaternion-local-systems), [R18.2/hecke-integral-extension](#r18.2-hecke-integral-extension), `ClassicalAdicEtaleCohomology:H0`, `ArithmeticLocallySymmetricSpaces:ALS.3`, `ClassicalAdicEtaleCohomology:H3`, `ClassicalAdicEtaleCohomology:H5`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`.

**API.**

- `QuaternionCohomology.hecke` (data): A correspondence acts by p₂,*∘coefficientTransport∘p₁*.
- `QuaternionCohomology.changeLevel` (functoriality): Level pullback and trace compose with the degree on a finite étale cover.
- `QuaternionCohomology.comparison` (compatibility): Betti–étale comparison intertwines the Hecke actions.
- `QuaternionCohomology.galoisCommutes` (relation): G_F commutes with correspondences defined over F.

**Unit tests.**

- `QuaternionCohomology.genusTwo` (computation): Constant rational coefficients on a connected genus-two curve give dimension 4.
- `QuaternionCohomology.identityCorrespondence` (degenerate): The identity correspondence acts as the identity.
- `QuaternionCohomology.coverDegree` (compatibility): For a finite étale cover of degree d, trace∘pullback=d on cohomology.

**Acceptance checks.**

- For constant coefficients on a connected genus-g complex curve, rank_Q_l H¹=2g.
- Compactness removes the modular-curve cusp correction, but does not remove coefficient torsion.

**Uses.**

- AutomorphicGaloisRepresentations:R19.2: Supplies the geometric Hecke module; the Galois representation and its compatibility are owned there.
- GL2ModularityLifting:R22.1: Supplies a finite module before any localization or patching.

**Source contracts.**

- [R18.2/cdn20](#r18-2-cdn20), §5.2.1, proof of Proposition 5.2, pp.41–42: Finite-level cohomology and commuting global/tower actions; generic machinery imported.

**Planet.** Quaternionic Hecke cohomology.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.4-integral-cohomology-control"></a>

### Integral torsion and reduction criteria

`HilbertModularVarietiesAndShimuraCurves:R18.4/integral-cohomology-control` · theorem · `TauCeti.Blueprint.Quaternionic.IntegralCohomologyControl`

For a maximal ideal m of the good-place Hecke algebra, if H⁰(X,L_k)_m and H⁰(X,L_k∨(1))_m vanish, then the localized H¹(X,L_O)_m is finite free over O, H²(X,L_O)_m has no O-torsion, and H¹(X,L_O)_m⊗k→H¹(X,L_k)_m is an isomorphism. Proving these vanishings for the intended non-Eisenstein systems is an explicit quaternionic coefficient-system obligation; arbitrary non-Eisenstein language alone is not substituted for them.

**Hypotheses.**

- B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary.
- O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.
- Generic integral coefficient long exact sequences, Poincaré duality, and compatible Hecke localization.

**Proof route.**

1. Use the O→O→k coefficient exact sequence to identify H¹[λ] from H⁰(L_k).
2. Apply duality to control H² torsion using the residual dual H⁰.
3. Use finiteness over the DVR for freeness and the coefficient exact sequence for reduction.

**Prerequisites.** [R18.4/finite-cohomology](#r18.4-finite-cohomology), `ClassicalAdicEtaleCohomology:H0`, `ClassicalAdicEtaleCohomology:H3`.

**Acceptance checks.**

- Finite generation alone does not imply free integral cohomology.
- Nontrivial residual invariant vectors can introduce torsion or defeat reduction control.

**Source contracts.**

- [R18.2/cdn20](#r18-2-cdn20), §5.2.1, p.41: Only the rational finite-level realization is stated in CDN20; the integral H⁰-vanishing criterion is the routine coefficient long exact sequence plus duality spelled out in the proof steps, with no source passage claimed for it.

**Closure obligations.** Residual cohomological vanishing; Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.4-cohomology-pairing"></a>

### Quaternionic cohomological duality

`HilbertModularVarietiesAndShimuraCurves:R18.4/cohomology-pairing` · comparison · `TauCeti.Blueprint.Quaternionic.CohomologyPairing`

Specialize Poincaré duality to obtain the perfect rational pairing H¹(X,L_E)×H¹(X,L_E∨(1))→E. At integral level the duality is a derived duality; it gives a perfect O-pairing on localized H¹ only under the preceding torsion/vanishing criteria and a chosen perfect coefficient lattice pairing. Pullback is adjoint to trace, and Hecke adjoints reverse the correspondence with its coefficient similitude factor.

**Hypotheses.**

- B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary.
- O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.

**Proof route.**

1. Apply generic smooth proper curve duality and the coefficient evaluation map.
2. Compare to Betti cup product and oriented fundamental class.
3. Reverse the correspondence and invoke the integral torsion criterion when asserting perfection over O.

**Prerequisites.** [R18.4/integral-cohomology-control](#r18.4-integral-cohomology-control), `ClassicalAdicEtaleCohomology:H3`, `ArithmeticLocallySymmetricSpaces:ALS.3`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`.

**Acceptance checks.**

- The Tate twist (1) is necessary on the étale dual coefficient.
- For constant rational coefficients the form is alternating on H¹.

**Source contracts.**

- [R18.2/cdn20](#r18-2-cdn20), §5.2.1, pp.41–42: CDN20 uses the finite-level étale H¹ of the curve; the duality is the generic proper-smooth-curve Poincaré duality (requested from ClassicalAdicEtaleCohomology H3), not a CDN20 statement.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.4-cohomological-eigenspaces"></a>

### Cohomological automorphic eigenspaces

`HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-eigenspaces` · comparison · `TauCeti.Blueprint.Quaternionic.CohomologicalEigenspaces`

Over a splitting characteristic-zero field, identify the cuspidal Hecke eigenspaces of the algebraic coefficient H¹ of X_U with the automorphic representations cohomological at the split real place and of the specified algebraic type at the other real places. For trivial coefficients the split real component has weight-two discrete series. Galois action on the multiplicity space is retained, but identifying it with a two-dimensional ρ_π and proving local–global compatibility are R19 statements.

**Hypotheses.**

- B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary.
- O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.
- Characteristic zero; actual coefficient-field models; generic Matsushima/cohomological decomposition and strong multiplicity one imported.

**Proof route.**

1. Compute the degree-one relative Lie algebra cohomology at the split real place.
2. Specialize the generic compact locally symmetric cohomological decomposition.
3. Apply R17.3 transfer with exact infinity types; leave the Galois identification to R19.

**Prerequisites.** [R18.4/finite-cohomology](#r18.4-finite-cohomology), `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`, `ArithmeticLocallySymmetricSpaces:ALS.5`.

**Acceptance checks.**

- The cohomological decomposition is not itself a purity theorem.
- A complex automorphic correspondence gives no automatic integral lattice equality.

**Source contracts.**

- [R18.2/cdn20](#r18-2-cdn20), §5.2.1, pp.41–42, Proposition 5.2: The weight-two automorphic realization; Galois compatibility imported rather than recreated.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.4-definite-indefinite-comparison"></a>

### Definite and indefinite Jacquet–Langlands eigenspaces

`HilbertModularVarietiesAndShimuraCurves:R18.4/definite-indefinite-comparison` · comparison · `TauCeti.Blueprint.Quaternionic.DefiniteIndefiniteComparison`

For quaternion algebras D⁰ and B with invariants exchanged at a finite place v and the designated real place, and a cuspidal GL₂ representation discrete series at every ramified place of either algebra, apply the two global JL correspondences. At levels transported away {v,τ}, identify their away-place Hecke eigensystems and multiplicity factors over actual common rational models. At v the split GL₂ representation and its division JL partner remain different carriers; the full definite functions and the full curve H¹ are not isomorphic.

**Hypotheses.**

- B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary.
- O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.
- The transfer domain and infinity weights match; actual common coefficient field as in R17.3 rational-models.

**Proof route.**

1. Import the invariant-exchange construction where its CDN hypotheses apply.
2. Apply global-jl separately for both ramification sets in the more general domain.
3. Take the specified level invariants and preserve away-place Hecke operators.

**Prerequisites.** [R18.3/definite-jl](#r18.3-definite-jl), [R18.4/cohomological-eigenspaces](#r18.4-cohomological-eigenspaces), `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/invariant-exchange`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`.

**Acceptance checks.**

- Only matching eigenspaces are compared; H¹ has a cohomological multiplicity factor.
- Norm-factor characters are excluded on the definite side.

**Source contracts.**

- [R18.2/cdn20](#r18-2-cdn20), §5.2.1, pp.40–42: Exchange of the local and real invariant with away-place identification.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.4-cohomological-degeneracy"></a>

### Cohomological degeneracy maps

`HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-degeneracy` · construction · `TauCeti.Blueprint.Quaternionic.QuaternionDegeneracy`

At w with B split, hyperspecial level and coefficient system unramified at w, the two canonical maps X_{U₀(w)}→X_U induce δ=(δ₁*,δ₂*):M_U²→M_{U₀(w)}. Their trace maps give the dual degeneracy map. They commute with G_F and away-w Hecke operators; the pullback/trace composition matrix is obtained from the local double-coset computation with degree q_w+1. Integral injectivity and saturated image require an Ihara theorem with explicit hypotheses, and are not inferred from the definite Lemma 7.1.

**Hypotheses.**

- B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary.
- O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.
- The coefficient action extends to the local semigroup; the two level morphisms use a specified diag(1,π_w).

**Proof route.**

1. Build the two maps by intersection of U with its conjugate.
2. Transport the coefficient sheaf and apply generic pullback and trace.
3. Compute the degree and off-diagonal double cosets; request the integral Ihara input separately.

**Prerequisites.** [R18.4/finite-cohomology](#r18.4-finite-cohomology), [R18.3/split-hecke-normalisation](#r18.3-split-hecke-normalisation), `ArithmeticLocallySymmetricSpaces:ALS.3`.

**API.**

- `QuaternionDegeneracy.pullback` (data): δ maps (a,b) to δ₁*a+δ₂*b with transported coefficients.
- `QuaternionDegeneracy.trace` (data): The reverse map is the pair of coefficient-compatible traces.
- `QuaternionDegeneracy.awayHecke` (compatibility): Both maps intertwine all Hecke correspondences away w.
- `QuaternionDegeneracy.degree` (characterisation): Each hyperspecial-to-Iwahori map has degree q_w+1.

**Unit tests.**

- `QuaternionDegeneracy.qTwo` (computation): For residue field F₂ the covering degree is 3.
- `QuaternionDegeneracy.tracePullback` (compatibility): The diagonal trace–pullback composition is q_w+1.
- `QuaternionDegeneracy.badPlace` (non-example): At a division place there is no hyperspecial GL₂-to-Iwahori map of this shape.

**Acceptance checks.**

- Each single hyperspecial-to-Iwahori cover has degree q_w+1.
- The definite norm-fibre proof does not establish the indefinite integral injectivity theorem.

**Uses.**

- R22 finite-level control: Defines the actual maps before imposing the integral Ihara/saturation hypothesis.
- R19 level comparisons: Provides equivariance on finite cohomology.

**Source contracts.**

- [R18.2/kw](#r18-2-kw), §7 (opening), Lemma 7.1, p.60: The definite model of the two level maps at w with U′w = U0(w). The indefinite cohomological construction is the standard pullback/trace along the two level morphisms; no packet source states it, and Carayol §§9.2–9.4 (previously cited) studies the p-level morphism v : Mn,H → Mn,v(H) instead.

**Planet.** Cohomological degeneracy maps.

**Closure obligations.** Indefinite integral Ihara and saturation; Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.4-quaternion-purity"></a>

### Quaternionic coefficient purity

`HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-purity` · theorem · `TauCeti.Blueprint.Quaternionic.QuaternionPurity`

At a finite good place away l, a specified algebraic projector on the auxiliary abelian scheme gives a rank-two lisse coefficient constituent pure of weight one. An algebraic symmetric/tensor coefficient system of total geometric weight r is pure of weight r; since X is proper smooth, H¹(X,L) is pure of weight r+1 for geometric Frobenius. The quaternionic rank-two constituent and its projector must be verified; the current R34.5 elliptic-family node alone is insufficient for this higher-dimensional auxiliary PEL family.

**Hypotheses.**

- B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary.
- O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.
- Good smooth fibre; l invertible; compatible Frobenius-commuting projectors and actual pure coefficient constituents.

**Proof route.**

1. Request the abelian-family/projector extension of R34.5.
2. Check the Morita/splitting constituent and the symmetric/tensor weight arithmetic.
3. Apply proper smooth Weil II purity to H¹.

**Prerequisites.** [R18.4/quaternion-local-systems](#r18.4-quaternion-local-systems), `WeightsInEtaleCohomology:R34.5/parabolic-cohomology-weight-comparison`, `WeightsInEtaleCohomology:R34.5`.

**Acceptance checks.**

- For a standard rank-two weight-one constituent and Sym^{k−2}, H¹ has weight k−1.
- Purity is imported from R34, not from JL or a trace formula.

**Source contracts.**

- [R18.2/yz](#r18-2-yz), §3.2, moduli problem F1,U′p, pp.553–554: The auxiliary quaternionic PEL family to which the requested projector purity applies; purity itself is Deligne’s Weil II via WeightsInEtaleCohomology R34.5, not a statement of YZ.

**Planet.** Quaternionic coefficient purity.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.4-finite-level-descent"></a>

### Finite-level invariants and trace control

`HilbertModularVarietiesAndShimuraCurves:R18.4/finite-level-descent` · theorem · `TauCeti.Blueprint.Quaternionic.FiniteLevelDescent`

For a finite effective étale Galois level cover X_{U′}→X_U with group Δ of order invertible in the coefficient ring and compatible local systems, pullback identifies H¹(X_U,L) with H¹(X_{U′},L)^Δ and |Δ|⁻¹trace is its inverse on invariants. When p divides |Δ|, replace this assertion by the Hochschild–Serre spectral sequence and coefficient torsion terms; no unconditional integral invariants equality is asserted.

**Hypotheses.**

- B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary.
- O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.
- Cover finite étale on the generic fibre and genuinely effective; |Δ| invertible for the displayed equality.

**Proof route.**

1. Apply the generic Cartan–Leray/Hochschild–Serre sequence.
2. Average the finite group to kill higher group cohomology.
3. Check trace/pullback and their equivariance under the away-level Hecke algebra.

**Prerequisites.** [R18.4/finite-cohomology](#r18.4-finite-cohomology), [R18.2/effective-small-level](#r18.2-effective-small-level), `ClassicalAdicEtaleCohomology:H0`.

**Acceptance checks.**

- For a p-group cover with Z_p coefficients the averaging inverse does not exist.
- An ineffective central level subgroup does not give the claimed deck group.

**Source contracts.**

- [R18.2/yz](#r18-2-yz), §4.2, construction of the coarse models, p.565: Effective finite level quotients; the invariants/trace statement is generic Hochschild–Serre for finite étale covers (ClassicalAdicEtaleCohomology H0), not stated in YZ.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.5"></a>

## R18.5. Bad-prime uniformisation

The local formal model is constructed by increasing formal opens in blow-ups, not an inverse limit of the projective blow-up models. Framing height, the direction of the quasi-isogeny and Weil descent are separate conventions. The maximal-level integral theorem and all-level rigid theorem have distinct outputs.

<a id="r18.5-drinfeld-half-plane"></a>

### Drinfeld upper half-plane

`HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-half-plane` · definition · `TauCeti.Blueprint.Quaternionic.DrinfeldHalfPlane`

The Drinfeld half-plane Ω_K is the rigid analytic open P¹_K\P¹(K), formed by removing the K-rational analytic points. Ω_K(C)=P¹(C)\P¹(K)=C\K in the affine chart with infinity removed. PGL₂(K) acts by homographies. This is not the algebraic complement of a Zariski-closed subscheme P¹(K). The affinoid exhaustion supplies its actual analytic open structure.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.

**Proof route.**

1. Construct the standard rational affinoids in P¹ using the imported analytic geometry.
2. Glue their increasing open union and prove its C-point description.
3. Use homographies to transport rational affinoids and descend the centre-trivial GL₂ action.

**Prerequisites.** `AdicSpacesPartII:R2/generic-fibre-functor-d`, `ReductiveGroupsPartII:RG2.2`.

**API.**

- `DrinfeldHalfPlane.points` (characterisation): Its C-points are P¹(C) minus P¹(K).
- `DrinfeldHalfPlane.homography` (data): PGL₂(K) acts through the usual fractional linear formula.
- `DrinfeldHalfPlane.affineChart` (compatibility): The affine chart identifies the C-points with C minus K.
- `DrinfeldHalfPlane.baseChange` (functoriality): Scalar extension identifies the Ω_K affinoid exhaustion with its C-exhaustion; it does not replace the removed set by P¹(C).

**Unit tests.**

- `DrinfeldHalfPlane.infinity` (degenerate): The point infinity is excluded.
- `DrinfeldHalfPlane.quadraticPoint` (example): For z∈K₂\K in a quadratic extension, z lies in Ω_K(C).
- `DrinfeldHalfPlane.scalarAction` (compatibility): Every central scalar in GL₂(K) acts trivially.
- `DrinfeldHalfPlane.algebraicComplement` (non-example): Removing finitely many K-rational points is insufficient: all P¹(K) must be excluded.

**Acceptance checks.**

- Infinity is a K-rational point and is excluded.
- A point in a quadratic extension not in K belongs to Ω.

**Uses.**

- Čerednik–Drinfeld uniformisation: The analytic local factor of the quaternionic curve.
- CDN20 §§1.2,5.2: Provides the actual local geometry and its tower.

**Source contracts.**

- [R18.2/bc](#r18-2-bc), Part I §§1–2, pp.49–53: Analytic structure from the Bruhat–Tits norm map.
- [R18.2/cdn20](#r18-2-cdn20), §1.2, pp.12–13: Actual analytic complement, not a scheme complement.

**Planet.** Drinfeld upper half-plane.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.5-affinoid-reduction"></a>

### Affinoid exhaustion and tree reduction

`HilbertModularVarietiesAndShimuraCurves:R18.5/affinoid-reduction` · construction · `TauCeti.Blueprint.Quaternionic.DrinfeldExhaustion`

For n≥1, set P_n=P¹(O_K/π^n) and U_n=P¹_C minus the union of open balls centered at P_n of radius |π|^n in the standard projective metric. These affinoids increase to Ω_C. The norm-class reduction r:Ω_C→|T_K| is PGL₂(K)-equivariant, and U_n is the inverse image of the closed tree ball of radius n about the standard vertex. Tree vertices are homothety classes of rank-two lattices; adjacent representatives satisfy πL⊊L′⊊L.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.

**Proof route.**

1. Import the GL₂ Bruhat–Tits tree specialization, including the norm-class realization.
2. Compute vertex/edge affinoids using the two adjacent lattice bases.
3. Identify the finite-ball inverse images and prove increasing exhaustive union.

**Prerequisites.** [R18.5/drinfeld-half-plane](#r18.5-drinfeld-half-plane), `ReductiveGroupsPartII:RG2.2`.

**API.**

- `DrinfeldExhaustion.affinoid` (structure): Each U_n descends from an affinoid over K.
- `DrinfeldExhaustion.increasing` (relation): U_n⊂U_{n+1} and their union is Ω_C.
- `DrinfeldExhaustion.treeBall` (characterisation): U_n=r⁻¹ of the radius-n tree ball.
- `DrinfeldExhaustion.equivariant` (compatibility): r(gz)=g r(z) for g∈PGL₂(K).

**Unit tests.**

- `DrinfeldExhaustion.residueTwo` (computation): For q=2 a vertex has 3 incident edges.
- `DrinfeldExhaustion.firstSphere` (computation): The radius-one tree ball has q+2 vertices.
- `DrinfeldExhaustion.centralScalar` (compatibility): Scaling a lattice changes neither its vertex nor the reduction class.

**Acceptance checks.**

- Every tree vertex has q+1 incident edges, in bijection with P¹(k).
- U_n depends on the chosen central vertex; Ω and its full group action do not.

**Uses.**

- CDN20 §1.2: Controls explicit affinoids and integral functions.
- R18.5 graph identification: Provides the tree indexing of components and nodes.

**Source contracts.**

- [R18.2/cdn20](#r18-2-cdn20), §1.2, p.12: Explicit affinoids and equivariant reduction.

**Planet.** Drinfeld affinoid exhaustion.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.5-drinfeld-formal-model"></a>

### Standard Drinfeld formal model

`HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-formal-model` · construction · `TauCeti.Blueprint.Quaternionic.DrinfeldFormalModel`

Start with X₀=P¹_O_K and form X_n by blowing up every smooth k-rational special-fibre point of X_{n−1}; take the π-adic completions. Remove the smooth k-rational points from X_n to form the formal open Ũ_n. Then Ũ_n⊂Ũ_{n+1}, its generic fibre is U_n,K, and Ω̂=⋃Ũ_n is a flat regular semistable formal model of Ω_K. Its components are P¹_k indexed by tree vertices and its nodes by tree edges, locally xy=π. The full GL₂(K) action factors through PGL₂(K).

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.

**Proof route.**

1. Use the existing admissible blow-up and generic-fibre-invariance API.
2. Compute the exceptional and strict-transform components and edge charts.
3. Glue formal opens, not an inverse limit of the projective blow-up models; extend the group action through lattice charts.

**Prerequisites.** [R18.5/affinoid-reduction](#r18.5-affinoid-reduction), `AdicSpacesPartII:R2/admissible-blow-up`, `AdicSpacesPartII:R2/generic-fibre-inverts-admissible-blow-ups`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

**API.**

- `DrinfeldFormalModel.genericFibre` (compatibility): The generic fibre of Ω̂ is Ω_K.
- `DrinfeldFormalModel.nodeChart` (data): At an edge the completed local equation is xy=π.
- `DrinfeldFormalModel.components` (equivalence): Special-fibre components and nodes identify with tree vertices and edges.
- `DrinfeldFormalModel.action` (functoriality): The PGL₂(K) action extends the analytic homography action.

**Unit tests.**

- `DrinfeldFormalModel.centralComponent` (compatibility): The initial vertex component is P¹_k with its q+1 rational attaching points.
- `DrinfeldFormalModel.qTwo` (computation): For q=2 each component meets three branches in the full model.
- `DrinfeldFormalModel.ramifiedNode` (non-example): For e=2, xy=π′² is a singular total-space local ring; regularity is not preserved.

**Acceptance checks.**

- At finite radius the outermost components have smaller valence; only the full tree has valence q+1 everywhere.
- The node xy=π is regular; ramified base change gives xy=π′^e and is not regular for e>1.

**Uses.**

- Boutot–Carayol II §8 and BZ Theorem 6.7: Represents local moduli and uniformizes integral curves.
- CDN20 §1.2: Actual formal model underlying its reduction/exhaustion.

**Source contracts.**

- [R18.2/cdn20](#r18-2-cdn20), §1.2, pp.12–13: Iterated blow-ups and union of formal opens.
- [R18.2/bc](#r18-2-bc), Part I §3, pp.53–56: Lattice/edge charts for the standard model.

**Planet.** Drinfeld formal model.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.5-special-formal-moduli"></a>

### Special formal quaternionic moduli

`HilbertModularVarietiesAndShimuraCurves:R18.5/special-formal-moduli` · definition · `TauCeti.Blueprint.Quaternionic.SpecialFormalModuli`

Let D/K be the local division quaternion algebra, O_D its maximal order containing the unramified quadratic order O₂. A strict special formal O_D-module X over a π-nilpotent O_Ǩ-scheme has O_K-height 4 and Lie(X) locally free of rank one over O₂⊗O_K O_S (hence rank two over O_S), with strict O_K action. Fix a framing Φ over kbar. The functor M_Dr(0) classifies (X,ρ) where ρ:X_Sbar→Φ_Sbar is an O_D-linear quasi-isogeny of relative height zero, modulo compatible isomorphism. M̃ allows heights 2m, m∈Z. BC uses the inverse framing arrow; invert it when comparing conventions.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- The strict formal-module and relative height carriers are supplied by R07.1–R07.2.

**Proof route.**

1. Specialize the generic p-divisible/Cartier-module carrier with the O_D action and special Lie condition.
2. Form the isomorphism-class functor with height-zero framing.
3. Check base change, arrow reversal and the locally constant relative-height components.

**Prerequisites.** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

**API.**

- `SpecialFormalModuli.specialLie` (characterisation): Lie is rank one over O₂⊗O_S.
- `SpecialFormalModuli.baseChange` (functoriality): Pull back X and its special-fibre framing along every nilpotent-base map.
- `SpecialFormalModuli.framingAction` (data): A framing quasi-isogeny δ acts by δ∘ρ.
- `SpecialFormalModuli.heightComponents` (structure): The arbitrary-height functor decomposes into the height-2m components.

**Unit tests.**

- `SpecialFormalModuli.heightZero` (degenerate): The framing object with identity ρ lies in M_Dr(0).
- `SpecialFormalModuli.absoluteHeight` (computation): When [K:Q_p]=2 the absolute p-height is 8.
- `SpecialFormalModuli.wrongLie` (non-example): An O_D-module whose Lie O₂ action has ranks (2,0) is not special.

**Acceptance checks.**

- Absolute p-height is 4[K:Q_p], not 4 for ramified or higher-degree K.
- Dropping the special Lie condition gives the wrong moduli problem.

**Uses.**

- Drinfeld representability and BZ §5: Determines the true local moduli problem and the component action.
- R18.2 integral-pdiv: Supplies the division-prime deformation interpretation.

**Source contracts.**

- [R18.2/bc](#r18-2-bc), Part II §§2, 5.16, Definition 8.1, pp.79–84, 97–98, 107: Local functor and BC framing direction.
- [R18.2/bz](#r18-2-bz), §5, pp.38–39, (5.18)–(5.20): Relative height and framing direction used here.

**Planet.** Special formal quaternionic moduli.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.5-drinfeld-representability"></a>

### Drinfeld representability theorem

`HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-representability` · theorem · `TauCeti.Blueprint.Quaternionic.DrinfeldRepresentability`

The special formal O_D-module functor M_Dr(0) is represented by Ω̂⊗O_K O_Ǩ. The equivalence is functorial on π-nilpotent bases, not just a bijection on geometric points, and identifies the universal special formal module. The group of framing quasi-isogenies is GL₂(K); on height zero the normalized action factors through PGL₂(K).

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- Strict special modules, fixed frame and arrow convention as above.

**Proof route.**

1. Use Dieudonné–Cartier theory to construct the rank-two lattice/sheaf data and its critical-index filtration.
2. Compare with the lattice-chart functor representing Ω̂, using BC II §§5–8.
3. Prove both natural transformations inverse on nilpotent bases and match the universal object/actions.

**Prerequisites.** [R18.5/special-formal-moduli](#r18.5-special-formal-moduli), [R18.5/drinfeld-formal-model](#r18.5-drinfeld-formal-model), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

**Acceptance checks.**

- A geometric point classification alone does not prove representability.
- The central scalar action on height zero must be normalized before factoring through PGL₂.

**Source contracts.**

- [R18.2/bc](#r18-2-bc), Part II Theorems 8.2,8.4, pp.107–109: Actual functorial local theorem.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.5-height-and-descent"></a>

### Height action and Frobenius descent

`HilbertModularVarietiesAndShimuraCurves:R18.5/height-and-descent` · comparison · `TauCeti.Blueprint.Quaternionic.HeightAndDescent`

Normalize arbitrary-height M̃_Dr≅M_Dr(0)×Z by a division uniformizer Π and its Hecke shift h(Π). Under BZ §5.9, δ∈GL₂(K) acts by (ω,m)↦(pr(δ)ω,m+ord_K det δ), where pr(δ)=h(Π)^{−ord det δ}δ on height zero. The product identification is independent of Π. For arithmetic descent use τ_c=Spf τ⁻¹ and the separate right Π⁻¹ Hecke translation in Theorem 6.7; do not conflate this translation with the normalized PGL₂ action.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.

**Proof route.**

1. Identify each height component with height zero using h(Π).
2. Compute the valuation shift and central scalar correction.
3. Compare the Frobenius twist diagram with BZ 6.7 using contravariance of Spf.

**Prerequisites.** [R18.5/drinfeld-representability](#r18.5-drinfeld-representability).

**Acceptance checks.**

- A scalar πI has determinant valuation 2 and shifts the height index by 2 even though its normalized Ω action is trivial.
- Replacing Π⁻¹ by Π reverses the displayed descent convention.

**Source contracts.**

- [R18.2/bz](#r18-2-bz), Proposition 5.9, p.39; Theorem 6.7, p.49: Separate height and Weil descent actions.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.5-arithmetic-quotient"></a>

### Arithmetic Drinfeld quotient

`HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient` · construction · `TauCeti.Blueprint.Quaternionic.ArithmeticDrinfeldQuotient`

For B/F division split at τ only and division at v, let B̌ exchange invariants at {τ,v}, so it is totally definite and split at v. For compact level U with U_v=O_B,v× and small U^v, form B̌×\[(Ω̂⊗O_Fv O_Fv̌)×B_f×/U], using fixed away-v identifications; B̌_v× acts by homography and the local valuation component ord_v Nrd. Its finite component decomposition uses Γ_g={b∈B̌×∩gU^v g⁻¹:ord_v det b=0}, projected to PGL₂(F_v). These projected groups are discrete cocompact and become torsion-free with sufficiently small tame level.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- Global B/F, τ,v and level as stated; effective central quotient and finite component representatives fixed.

**Proof route.**

1. Apply adelic finiteness and approximation for the definite exchange algebra.
2. Compute the valuation-zero stabilisers and their effective projective images.
3. Construct separated proper formal quotients by the free cocompact action using edge charts; algebraize via the generic proper formal-curve theorem.

**Prerequisites.** [R18.5/height-and-descent](#r18.5-height-and-descent), `AdelicAlgebraicGroups:AA.3`, `AdelicAlgebraicGroups:AA.4`, `AdicSpacesPartII:R2`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

**API.**

- `ArithmeticDrinfeldQuotient.components` (data): Connected pieces are the specified projective Γ_g quotients after unramified base change.
- `ArithmeticDrinfeldQuotient.cocompact` (structure): Each effective Γ_g is discrete and cocompact in PGL₂(F_v).
- `ArithmeticDrinfeldQuotient.changeLevel` (functoriality): Nested tame levels give the corresponding finite quotient maps.
- `ArithmeticDrinfeldQuotient.algebraisation` (compatibility): At sufficiently small level the proper formal curve algebraizes with the same generic fibre.

**Unit tests.**

- `ArithmeticDrinfeldQuotient.scalar` (compatibility): Central scalar homographies are ineffective; their valuation effect is retained separately.
- `ArithmeticDrinfeldQuotient.node` (computation): At free level an edge orbit has node chart xy=π.
- `ArithmeticDrinfeldQuotient.nonfree` (non-example): A quotient with a nontrivial effective vertex stabiliser cannot use the free-action regularity argument.

**Acceptance checks.**

- The quotient by full B̌× includes the valuation component; a single Γ_g quotient is only one component after the specified unramified base change.
- Removing the tame-smallness hypothesis yields a coarse finite quotient and loses automatic regularity.

**Uses.**

- BZ Theorem 6.7 and BC III Theorem 5.2: Builds the arithmetic local object before asserting canonical-curve identification.

**Source contracts.**

- [R18.2/bz](#r18-2-bz), §1, pp.1–3; §6, pp.45–50: Totally real arithmetic quotient and fixed-point-free level.
- [R18.2/bc](#r18-2-bc), Part III §§5.1–5.3, pp.139–142: Rational-field component decomposition and small-level fence.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.5-totally-real-uniformisation"></a>

### Čerednik–Drinfeld uniformisation

`HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation` · theorem · `TauCeti.Blueprint.Quaternionic.TotallyRealUniformisation`

For totally real F, B division split only at τ, v with B_v division, U_v=O_B,v× and the other p-adic factors and tame level as in BZ (6.31), the completion of the canonical integral Shimura curve over O_Eν identifies with B̌×\[(Ω̂_Fv⊗O_Fv O_Eν̌)×B_f×/U]. Here E=τ(F), E_ν=F_v. It is compatible with level transitions and Hecke operators at the permitted levels. With τ_c=Spf τ⁻¹, natural descent corresponds on the quotient to id_Ω×|Π⁻¹×τ_c. For small tame level the model is regular semistable and stable.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- All local factors match BZ (6.31); sufficiently small U^v for the final stable/regular claim.

**Proof route.**

1. Use the shared PEL/Rapoport–Zink basic uniformisation theorem with its Hasse-principle/surjectivity hypotheses.
2. Identify the local RZ factor with Drinfeld moduli, and transfer from the auxiliary PEL curve via the open-and-closed component comparison.
3. Apply BZ Theorem 6.7 and check the Π⁻¹ Frobenius diagram; obtain regular/stable geometry from Corollary 6.8.

**Prerequisites.** [R18.5/arithmetic-quotient](#r18.5-arithmetic-quotient), [R18.2/connected-pel-comparison](#r18.2-connected-pel-comparison), [R18.2/quaternion-pel-instance](#r18.2-quaternion-pel-instance), [R18.1/canonical-quaternionic-curve](#r18.1-canonical-quaternionic-curve), [R18.1/quaternionic-reflex-dimension](#r18.1-quaternionic-reflex-dimension), `PELModuli:M2`.

**Acceptance checks.**

- This is over the completed maximal unramified local field, not a finite extension substituted for it.
- BC III proves the arithmetic theorem over Q; it is not the citation for arbitrary F.

**Source contracts.**

- [R18.2/bz](#r18-2-bz), Theorem 6.7 and Corollary 6.8, pp.49–50: Totally real theorem with exact level and descent data.

**Planet.** Čerednik–Drinfeld uniformisation.

**Closure obligations.** Missing formal carriers in suggested Lean; Cross-part connected-comparison descent over K. See the closure ledger.

<a id="r18.5-rational-uniformisation"></a>

### Rational-field comparison

`HilbertModularVarietiesAndShimuraCurves:R18.5/rational-uniformisation` · comparison · `TauCeti.Blueprint.Quaternionic.RationalUniformisation`

For F=Q, a division quaternion algebra ramified at p and split at infinity, and maximal p-level with sufficiently small tame U^p, specialize the uniformisation to BC III Theorem 5.2. Match its left/right actions via the chosen algebra anti-isomorphism and its Frobenius–determinant twist with the BZ convention. The isomorphism also compares the universal special formal O_D modules. The split B=M₂(Q) modular curve is outside this division-prime assertion.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.

**Proof route.**

1. Apply the totally real theorem with F=Q.
2. Identify the invariant-swapped definite algebra and BC’s level component set.
3. Match anti-isomorphism, determinant-valuation descent and universal formal module.

**Prerequisites.** [R18.5/totally-real-uniformisation](#r18.5-totally-real-uniformisation), `ModularCurvesPartII:R12.2`.

**Acceptance checks.**

- The arithmetic base is Q_p here; BC’s local Parts I–II permit general K.
- The rational split modular curve uses the ModularCurves supplier, not this compact theorem.

**Source contracts.**

- [R18.2/bc](#r18-2-bc), Part III Theorem 5.2 and comments, pp.140–142: Primary rational-field arithmetic theorem and action conventions.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.5-tower-uniformisation"></a>

### All-level Drinfeld tower uniformisation

`HilbertModularVarietiesAndShimuraCurves:R18.5/tower-uniformisation` · theorem · `TauCeti.Blueprint.Quaternionic.TowerUniformisation`

In CDN20 §5.2.1, E is totally real with E_𝔭=K; B̌ is split only at ∞₀ and division at 𝔭; B exchanges these invariants and is definite. With the fixed identifications of local and away-𝔭 groups, sufficiently small tame U and the exact congruence subgroups Ǧ_n at 𝔭, there are rigid isomorphisms Sh_n(U)^an≅B×\[M_n×B(A_f^𝔭)×/U] for every n≥1, compatible in n,U. M_n is the corresponding Drinfeld cover defined by the universal special formal module’s level structure. The theorem is on rigid generic fibres; it does not assert every high-level integral cover is semistable without alteration.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- Exact CDN20 tower convention Ǧ_n retained; U sufficiently small.

**Proof route.**

1. Construct the generic Drinfeld covers from the universal formal module and matching local congruence levels.
2. Use the basic Rapoport–Zink uniformisation of the auxiliary PEL family with p-level structures on the rigid generic fibre (PELModuli:M2 request), transported through the open-and-closed component comparison; it identifies the v-part of the quaternionic p-divisible group with the pullback of the universal special formal module, so the level-n covers on both sides are the same torsors of level structures. The maximal-level theorem alone does not give the tower.
3. Apply CDN Proposition 5.4 and verify the commuting transitions and away-level actions.

**Prerequisites.** [R18.5/drinfeld-representability](#r18.5-drinfeld-representability), [R18.5/totally-real-uniformisation](#r18.5-totally-real-uniformisation), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `PELModuli:M2`, [R18.2/quaternion-pdiv-tower](#r18.2-quaternion-pdiv-tower).

**Acceptance checks.**

- The n-level source and target use the same local congruence subgroup.
- Compatibility in n is part of the theorem, not a consequence of unrelated levelwise isomorphisms.

**Source contracts.**

- [R18.2/cdn20](#r18-2-cdn20), §5.2.1–5.2.2, pp.40–43, Proposition 5.4: Tower theorem with explicit global setup.
- [R18.2/bc](#r18-2-bc), Part III §5.5, Théorème (5.5), p.146: The rational-field all-level statement; the totally real case is CDN20 Proposition 5.4.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.5-tree-dual-graph"></a>

### Quaternionic dual graph identification

`HilbertModularVarietiesAndShimuraCurves:R18.5/tree-dual-graph` · comparison · `TauCeti.Blueprint.Quaternionic.TreeDualGraph`

At small maximal division-prime level, the geometric special-fibre dual graph is the finite disjoint union of Γ_g\T_K corresponding to the arithmetic quotient components. Vertices index rational components and edges index nodes, with loops and repeated edges retained in the quotient graph. The graph carries the Frobenius permutation induced by the Π⁻¹ descent, and Hecke/level maps are the transported adelic correspondences on vertex/edge orbits.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- Tame level sufficiently small for free local charts; generic dual multigraph supplied by StableReduction.

**Proof route.**

1. Read the quotient’s local semistable charts and index its components and intersections.
2. Apply the generic normalization/dual-graph API with branch incidence, including loops.
3. Transport descent, Hecke and level correspondences through uniformisation.

**Prerequisites.** [R18.5/totally-real-uniformisation](#r18.5-totally-real-uniformisation), [R18.5/drinfeld-formal-model](#r18.5-drinfeld-formal-model), `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

**Acceptance checks.**

- The quotient graph need not be a tree although T_K is a tree.
- Over an unramified base every node has thickness 1.

**Source contracts.**

- [R18.2/bc](#r18-2-bc), Part III §5.4, pp.144–146 (graph); generic monodromy imported from R11.4: Dual-graph quotient and arithmetic descent.
- [R18.2/yz](#r18-2-yz), §8.3, ‘Multiplicity function: the superspecial case’, pp.619–620: Lattice class indexing of quaternionic special-fibre components.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.5-character-monodromy"></a>

### Quaternionic character lattice and monodromy

`HilbertModularVarietiesAndShimuraCurves:R18.5/character-monodromy` · comparison · `TauCeti.Blueprint.Quaternionic.CharacterMonodromy`

For the Jacobian of a small-level semistable uniformized curve, identify the toric character lattice with H₁(Γ_g\T_K,Z), compatibly with Hecke and descent. Under the generic semistable-Jacobian monodromy theorem the pairing is the oriented cycle edge pairing Σ_e thickness(e)a_e b_e. At the unramified regular maximal-level model thickness is 1. Its cokernel presents the geometric component group using the dual lattice; Frobenius descent determines the arithmetic group.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- Generic semistable Jacobian/Néron and graph monodromy theorem supplied; connected component handled separately.

**Proof route.**

1. Apply the supplied character-lattice theorem to the identified nodal graph.
2. Compute all edge lengths from xy=π charts.
3. Transport Hecke/Frobenius action and distinguish geometric component-group cokernel from its descended points.

**Prerequisites.** [R18.5/tree-dual-graph](#r18.5-tree-dual-graph), `NeronModelsAndSemistableAbelianVarieties:R11.4`, `tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion`, `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`.

**Acceptance checks.**

- A graph with one cycle of r edges of thickness 1 gives pairing value r on its cycle generator.
- Replacing the quotient graph by the universal tree would falsely give zero toric rank.

**Source contracts.**

- [R18.2/bc](#r18-2-bc), Part III §5.4, pp.144–146 (graph); generic monodromy imported from R11.4: Graph identification; monodromy theorem is a separate supplier, not attributed to these pages.

**Closure obligations.** Missing formal carriers in suggested Lean. See the closure ledger.

<a id="r18.6"></a>

## R18.6. The geometric outputs used by modularity

This layer indexes consumers of the preceding mathematical outputs. It
adds no theorem, definition or planet. Every export retains the supplying node’s
hypotheses and closure gaps.

**[R18.2/regular-model-tower](#r18.2-regular-model-tower), [R18.2/hecke-integral-extension](#r18.2-hecke-integral-extension), [R18.2/integral-pdiv](#r18.2-integral-pdiv), [R18.4/quaternion-local-systems](#r18.4-quaternion-local-systems), [R18.4/finite-cohomology](#r18.4-finite-cohomology), [R18.4/quaternion-purity](#r18.4-quaternion-purity) → `AutomorphicGaloisRepresentations:R19.2`.** Actual canonical proper curves, discriminant-qualified regular models, local systems, commuting Hecke/G_F action and conditional R34-purity. Constructing ρ_π and its local–global compatibility is R19 work.

**[R18.3/neatness-base-change](#r18.3-neatness-base-change), [R18.3/integral-pairing](#r18.3-integral-pairing), [R18.3/tw-level](#r18.3-tw-level), [R18.3/tw-freeness](#r18.3-tw-freeness), [R18.3/tw-localised-control](#r18.3-tw-localised-control), [R18.3/dyadic-norm-twist](#r18.3-dyadic-norm-twist), [R18.3/dyadic-hecke-twist](#r18.3-dyadic-hecke-twist), [R18.4/integral-cohomology-control](#r18.4-integral-cohomology-control), [R18.4/cohomological-degeneracy](#r18.4-cohomological-degeneracy) → `GL2ModularityLifting:R22.1`, `GL2ModularityLifting:R22.2`, `GL2ModularityLifting:R22.6`.** Finite integral modules with all smallness, coefficient pairing, residual vanishing, distinct-root, isotropy-exponent and Ihara hypotheses visible. R22 chooses Q and applies patching; the indefinite integral Ihara gap is not advertised as proved.

**[R18.3/neatness-base-change](#r18.3-neatness-base-change), [R18.3/integral-pairing](#r18.3-integral-pairing) → `SerreWeightAndLevelOptimisation:R20.6`, `PotentialModularityAndCompatibleSystems:R23.3`.** Reduction-surjectivity and pairing under verified neatness hypotheses, with the Khare Lemma 2.2 exact-statement gap retained; no modularity imported upstream.

**[R18.5/totally-real-uniformisation](#r18.5-totally-real-uniformisation), [R18.5/tower-uniformisation](#r18.5-tower-uniformisation), [R18.5/tree-dual-graph](#r18.5-tree-dual-graph), [R18.5/character-monodromy](#r18.5-character-monodromy) → `SerreWeightAndLevelOptimisation:R20.4`, `NeronModelsAndSemistableAbelianVarieties:R11.6`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.1`.** Exact division-prime maximal-level formal theorem and Frobenius descent, all-level rigid tower maps, arithmetic dual graphs and supplier-based monodromy.

**[R18.2/quaternion-pel-instance](#r18.2-quaternion-pel-instance), [R18.2/regular-model-tower](#r18.2-regular-model-tower), [R18.5/tower-uniformisation](#r18.5-tower-uniformisation) → `PerfectoidShimuraVarieties:S5`.** Effective canonical finite-level tower and its actual normal integral models. Perfectoid limits and Hodge–Tate maps are proved by the consumer, independently of finite-level modularity.

**[H6/moret-bailly-input-export](#h6-moret-bailly-input-export) → `PotentialModularityAndCompatibleSystems:R23.1`, `PotentialModularityAndCompatibleSystems:R23.2`.** H6 supplies paired Hilbert and Allen elliptic torsion twists, component descent and prescribed local-open targets. The Taylor structured-realization and Allen finite-local pairing gaps remain conditions on this export. R23.1–R23.2 proves Moret–Bailly and potential modularity; it does not construct these moduli inputs.

## Supplier contracts

Stage-only external prerequisites have the following precise producer contracts.
They are requests, not assertions of completed formalisation. Cross-part inputs
are named nodes in the declaration plan; H6 and R18.1 are not blanket supplier
requests. When the same supplier occurs twice, the entries retain the distinct
Hilbert and quaternionic contracts and consumers.

### H0 contracts

**`AbelianSchemesAndArithmeticModuliPartII:F3`.** Import the reviewed honda-tate node for the underlying finite-field isogeny class. Extend its realization contract to the specified O-action, ordinary slopes and ordered polarization used by Taylor Lemma1.3; the unpolarized simple-class classification alone does not supply this structured witness. Keep Honda existence proof with this owner.

Consumers: [H6/hilbert-finite-local-points](#h6-hilbert-finite-local-points).

**`AbelianSchemesAndArithmeticModuli:A1`.** Relative abelian-scheme/group-over-base carrier, endomorphism sheaf and real-multiplication action, base change and rigidity for the N≥4 Hilbert tame marking. Reuse the pinned Scheme and Tau Ceti group-object/abelian-variety carriers; an abelian variety over a field is not yet this relative object.

Consumers: [H1/symmetric-polarizations](#h1-symmetric-polarizations).

**`AbelianSchemesAndArithmeticModuli:A2`.** Dual abelian scheme with biduality, symmetric O-linear Hom sheaf, positive polarizations from ample bundles, Rosati fixing O, and pullback compatibility. The existing rosati-involution node is imported, but alone does not provide this relative dual/polarization package.

Consumers: [H1/symmetric-polarizations](#h1-symmetric-polarizations).

**`AbelianSchemesAndArithmeticModuli:A3`.** Serre tensor A⊗_O c for invertible modules; Cartier-dual finite-flat torsion and perfect Weil pairing; quotients by finite locally free O-stable subgroups and dual-isogeny/polarization descent. Supply all pairing twists and quotient base-change maps used here, including the μ_N versus marked-point isogeny comparison.

Consumers: [H1/symmetric-polarizations](#h1-symmetric-polarizations), [H1/c-polarization](#h1-c-polarization), [H1/tame-level-functors](#h1-tame-level-functors), [H1/linear-weil-pairing](#h1-linear-weil-pairing), [H3/hilbert-hecke-isogenies](#h3-hilbert-hecke-isogenies), [H4/hybrid-full-level](#h4-hybrid-full-level), [H4/integral-gamma0](#h4-integral-gamma0).

**`AbelianSchemesAndArithmeticModuli:A4`.** Hodge exact sequence with O-action and the Lie characteristic polynomial, polarized O-linear Grothendieck–Messing comparison with the Hilbert local model, and Serre–Tate deformation equivalence retaining endomorphisms and c-polarization. For the ordinary H6 construction include the lift of the finite extension class with its sign and local character twists.

Consumers: [H1/hilbert-determinant](#h1-hilbert-determinant), [H2/dp-flat-normal](#h2-dp-flat-normal), [H2/dp-determinant-all-bases](#h2-dp-determinant-all-bases), [H2/rapoport-locus](#h2-rapoport-locus), [H2/ordinary-rapoport](#h2-ordinary-rapoport), [H6/hilbert-finite-local-points](#h6-hilbert-finite-local-points), [H6/allen-finite-local-points](#h6-allen-finite-local-points).

**`AlgebraicModuliForArithmeticGeometry:R09.1`.** Relative rank-g Grassmannian and invariant-subbundle equations: closed representability of O-stability and the self-orthogonal wedge condition, with universal subbundle and arbitrary base change. No abelian moduli construction is requested here.

Consumers: [H2/dp-local-model](#h2-dp-local-model).

**`AlgebraicModuliForArithmeticGeometry:R09.3`.** Effective finite étale descent of quasi-projective schemes, actual abelian families, endomorphisms and ordered polarizations under a finite, possibly NONCOMMUTATIVE symplectic Isom-torsor, retaining a descended ample power and universal moduli property. Also algebraic-space descent from the fine full-tame DP presentation. Quasi-coherent module descent and R09.4 commutative torsor twists alone do not supply this.

Consumers: [H2/dp-integral-model](#h2-dp-integral-model), [H6/torsion-isom-torsor](#h6-torsion-isom-torsor), [H6/simultaneous-torsion-twist](#h6-simultaneous-torsion-twist), [H6/twisted-component-descent](#h6-twisted-component-descent).

**`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`.** Grothendieck–Messing with O-endomorphism/polarization structures at p=2 and ramified p, and the finite-flat residual torsion comparison in Allen Lemma7.1.8: supersingular induced type or the indicated ordinary finite H_f extension, with connected–étale orientation. Do not infer every local residual module is realizable.

Consumers: [H2/dp-flat-normal](#h2-dp-flat-normal), [H6/hilbert-finite-local-points](#h6-hilbert-finite-local-points), [H6/allen-finite-local-points](#h6-allen-finite-local-points).

**`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.** Per accepted RT-AREA-padic-1/26, generic BT₁ Ha=det(V*) in (detω)^(p−1), its base-change law and intrinsic ordinary criterion at EVERY p including2; polarized O-linear ordinary decomposition sufficient for ω to be rank one over O⊗k. Generic Fargues LF and intrinsic BT₁ Hodge–Tate map remain here; H2 only specializes Ha and its ideal, and T0 owns the boundary extension downstream.

Consumers: [H2/ordinary-rapoport](#h2-ordinary-rapoport), [H2/hilbert-hasse-ideal](#h2-hilbert-hasse-ideal).

**`AlgebraicModuliForArithmeticGeometry:R09.5`.** Finite effective unit-group quotients in the algebraic-space category, identification of free finite constant group actions with finite étale torsors, their Cartesian base changes and compatible characteristic-zero canonical comparisons. State the scheme/descent hypotheses rather than asserting a universal family on arbitrary coarse quotients; compare the pre-existing finite étale quotient owner.

Consumers: [H3/arithmetic-quotient](#h3-arithmetic-quotient), [H4/arithmetic-full-level](#h4-arithmetic-full-level).

**`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.** General finite locally free subgroup-scheme/Cartier-dual carrier with rank, O-action, isotropy and base change used for integral Γ₀ levels. The p-divisible-group and Raynaud specialized nodes do not by themselves supply this subgroup parameter functor.

Consumers: [H4/integral-gamma0](#h4-integral-gamma0).

**`ModularCurvesPartII:R12.2`.** The canonical Q modular curve, its tame μ_N/point-level comparison by quotient and Cartier duality, finite-flat Γ₀ levels and rational split-quaternion identification, all with matching field, marking and effective stabilizers.

Consumers: [H5/rational-modular-comparison](#h5-rational-modular-comparison), [R18.1/canonical-quaternionic-curve](#r18.1-canonical-quaternionic-curve).

**`AbelianSchemesAndArithmeticModuli:A5`.** Algebraization of the trace-polarized complex/real Hilbert torus, the homological lattice period map and its compatibility with dual/tame/pairing levels. Supply the real involution and polarization-sign computation used to identify paired torsion frames.

Consumers: [H6/real-torsion-points](#h6-real-torsion-points).

**`ReductiveGroupsPartII:RG2.0a`.** Restriction of scalars, central algebraic-group quotients and fibre products on existing carriers, including Res B×, its norm-one derived group and the quotient (B××E×)/{(a⁻¹,a)} with descended norm/conjugation maps.

Consumers: [R18.1/quaternionic-datum](#r18.1-quaternionic-datum), [R18.1/yz-bridge-groups](#r18.1-yz-bridge-groups).

**`tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`.** Existing quaternion algebra, conjugation, reduced norm/trace, real matrix splitting and CM scalar extension comparison used for the quaternionic datum and PEL bridge. Import upstream rather than proposing another quaternion algebra.

Consumers: [R18.1/quaternionic-datum](#r18.1-quaternionic-datum).

**`ShimuraVarieties:V8`.** Canonical finite-level models and complex uniformization over the D3 reflex field for the D4 SV1–SV3 quaternionic datum, whose central weight need not be Q-rational; small-level effective quotient, properness and datum-map descent. Existing finite-level-maps/datum-functoriality nodes are used, but do not alone state this canonical-model endpoint.

Consumers: [R18.1/canonical-quaternionic-curve](#r18.1-canonical-quaternionic-curve).

**`ReductiveGroupsPartII:RG2.0`.** Real/local points and their topology on the imported quaternion and restriction-of-scalars algebraic groups, including arithmetic subgroup actions and their scalar kernels.

Consumers: [R18.1/quaternionic-effective-stabilizers](#r18.1-quaternionic-effective-stabilizers).

**`ReductiveGroupsPartII:RG2.3`.** Integral quaternion order levels (1+NÔ_B)×, their compact openness and nested-level comparison, with effective rational scalar stabilizers computed separately.

Consumers: [R18.1/quaternionic-effective-stabilizers](#r18.1-quaternionic-effective-stabilizers).

### R18.2 contracts

**`PELModuli:M0`.** Supply the integral PEL datum carrier with involution, trace/different dual lattice, signatures and determinant condition; the B′ datum here is only an instance.

Consumers: [R18.2/quaternion-pel-instance](#r18.2-quaternion-pel-instance).

**`PELModuli:M1`.** Supply generic PEL functors, O_B-actions, universal abelian schemes and p-divisible torsion sheaves with level-compatible descent. The quaternionic specialization does not reconstruct these carriers.

Consumers: [R18.2/quaternion-pel-instance](#r18.2-quaternion-pel-instance), [R18.2/quaternion-pdiv-tower](#r18.2-quaternion-pdiv-tower), [R18.2/integral-pdiv](#r18.2-integral-pdiv), [R18.2/bridge-tate-comparison](#r18.2-bridge-tate-comparison).

**`PELModuli:M2`.** Supply good-prime PEL representability and the generic basic Rapoport–Zink uniformisation comparison, including p-level structures on the rigid generic fibre and the identification of the universal p-divisible group, with its Hasse-principle/surjectivity and nilpotent-base deformation hypotheses. The latter is a PELModuli Part II extension, not supplied by current M5 examples; BZ §6.2 is the source contract.

Consumers: [R18.2/quaternion-pel-instance](#r18.2-quaternion-pel-instance), [R18.2/carayol-split-model](#r18.2-carayol-split-model), [R18.5/totally-real-uniformisation](#r18.5-totally-real-uniformisation), [R18.5/tower-uniformisation](#r18.5-tower-uniformisation).

**`PELModuli:M4`.** Supply canonical-model comparison, finite normal integral level changes and finite effective coarse quotients; no universal family on an arbitrary normalization is assumed.

Consumers: [R18.2/carayol-split-model](#r18.2-carayol-split-model), [R18.2/coarse-model](#r18.2-coarse-model).

**`AdelicAlgebraicGroups:AA.3`.** Supply compactness modulo centre and finiteness of the definite adelic component/class set, with exact rational versus adelic central quotients.

Consumers: [R18.5/arithmetic-quotient](#r18.5-arithmetic-quotient).

**`AdelicAlgebraicGroups:AA.4`.** Supply strong approximation for quaternion norm-one groups with a noncompact split finite factor, and level-map degrees/effective stabilisers. No false strong approximation for tori is used.

Consumers: [R18.2/hecke-integral-extension](#r18.2-hecke-integral-extension), [R18.5/arithmetic-quotient](#r18.5-arithmetic-quotient).

**`AdelicAlgebraicGroups:AA.5`.** Supply the definite quaternion compactness/class-set validation. Use AA.3 for general reduction theory and AA.4 for the norm-fibre strong-approximation theorem.

Consumers: [R18.3/definite-class-set](#r18.3-definite-class-set), [R18.3/norm-branch](#r18.3-norm-branch), [R18.3/isotropy-exponent](#r18.3-isotropy-exponent).

**`GL2AutomorphicRepresentationsAndTransfer:R16.2`.** Supply local division-quaternion valuation, maximal compact and scalar-square quotient conventions; the dyadic sign specialization here is arithmetic geometry, not a new local Langlands correspondence.

Consumers: [R18.3/dyadic-sign-extension](#r18.3-dyadic-sign-extension).

**`GL2AutomorphicRepresentationsAndTransfer:R17.3`.** Supply global JL after excluding norm characters, infinity-weight matching, split Hecke normalization and actual rational models. Add the supplier edge to R18.3 required by RT-AREA-automorphic-1/12; R18.4 inherits it.

Consumers: [R18.3/norm-branch](#r18.3-norm-branch).

**`AutomorphicFormsOnReductiveGroups:AF.4`.** Supply Sym^{k−2} tensor coefficient lattices, scalar extension, semigroup coefficient action and its perfect-pairing range; quaternionic weight specialization retains all local splitting hypotheses.

Consumers: [R18.3/quaternion-weight](#r18.3-quaternion-weight), [R18.3/integral-pairing](#r18.3-integral-pairing).

**`AutomorphicFormsOnReductiveGroups:AF.5`.** Extend the existing AF.5 carrier and evaluation theorem to fixed central character on D×\D_f×/(UZ) with effective Γ_t=(UZ∩t⁻¹D×t)/F×. The existing discrete-centre hypothesis excludes positive-rank O_F×. Supply generic coefficient-function Hecke and level maps and abstract versus acting Hecke algebra; R18.3 only specializes them.

Consumers: [R18.3/integral-pairing](#r18.3-integral-pairing), [R18.3/split-hecke-normalisation](#r18.3-split-hecke-normalisation), [R18.3/definite-degeneracy](#r18.3-definite-degeneracy), [R18.3/tw-level](#r18.3-tw-level), [R18.3/residual-hecke-ideal](#r18.3-residual-hecke-ideal).

**`AutomorphicBundles:B2`.** Supply rational automorphic line bundles, norm/pullback maps and the generic Hodge/dualizing identification. R18.2 owns its coarse quaternionic branch correction and metric normalization.

Consumers: [R18.2/arithmetic-hodge-line](#r18.2-arithmetic-hodge-line).

**`ArakelovGeometryAndAbelianHeights:R35.2`.** Supply generic hermitian rational lines, arithmetic degree and norm descent of metrics; consume the quaternionic Hodge line without redoing its integral model. Heights and Colmez identity remain here, not in R18.

Consumers: [R18.2/arithmetic-hodge-line](#r18.2-arithmetic-hodge-line).

**`CrystallineCohomology:CR.7`.** Supply strict O_v-relative covariant Dieudonné crystals, special Lie/Hodge filtration and Grothendieck–Messing tangent comparison. At ramified v the raw τ-quotient is nonexact: a saturated relative filtration/determinant theorem is required.

Consumers: [R18.2/integral-kodaira-spencer](#r18.2-integral-kodaira-spencer).

**`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.** Supply strict formal O_K-modules, special O_D-actions, relative heights, Cartier duals, finite torsion levels and moduli of framed quasi-isogenies; absolute p-height must scale by [K:Q_p].

Consumers: [R18.5/special-formal-moduli](#r18.5-special-formal-moduli), [R18.5/tower-uniformisation](#r18.5-tower-uniformisation).

**`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.** Supply integral Dieudonné/Cartier equivalence on nilpotent bases, compatible duality and structured tensor/filtration comparison in the admissible coefficient components, including strict O_K-relative ranks.

Consumers: [R18.2/bridge-filtered-crystal](#r18.2-bridge-filtered-crystal), [R18.5/special-formal-moduli](#r18.5-special-formal-moduli), [R18.5/drinfeld-representability](#r18.5-drinfeld-representability).

**`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.** Supply full faithfulness and all-prime crystalline Barsotti–Tate lattice classification over O_L, including p=2 (Kim/Lau/Liu scope), with descent after finite extension. Tensor products require the componentwise absence of weight −2.

Consumers: [R18.2/bridge-point-extension](#r18.2-bridge-point-extension), [R18.2/bridge-filtered-crystal](#r18.2-bridge-filtered-crystal).

**`ArithmeticLocallySymmetricSpaces:ALS.1`.** Supply the generic associated coefficient local system and its singular chain/sheaf realization. TauCeti.LocalCoefficientSystem supplies only the fundamental-groupoid functor carrier.

Consumers: [R18.4/quaternion-local-systems](#r18.4-quaternion-local-systems).

**`ArithmeticLocallySymmetricSpaces:ALS.3`.** Supply coefficient-compatible Hecke correspondence pullback/trace and composition on actual complexes, with finite-cover and orientation conventions.

Consumers: [R18.4/finite-cohomology](#r18.4-finite-cohomology), [R18.4/cohomology-pairing](#r18.4-cohomology-pairing), [R18.4/cohomological-degeneracy](#r18.4-cohomological-degeneracy).

**`ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`.** Supply early finite-level derived integral duality, pullback/trace adjoints and coefficient change before completed cohomology or automorphic comparison.

Consumers: [R18.4/finite-cohomology](#r18.4-finite-cohomology), [R18.4/cohomology-pairing](#r18.4-cohomology-pairing).

**`ArithmeticLocallySymmetricSpaces:ALS.5`.** Supply the characteristic-zero cohomological automorphic decomposition and real discrete-series/relative Lie algebra computation. Only this late spectral comparison uses the spectral supplier; it is not imported into early finite-level duality.

Consumers: [R18.4/cohomological-eigenspaces](#r18.4-cohomological-eigenspaces).

**`ClassicalAdicEtaleCohomology:H0`.** Supply actual derived étale cohomology with integral inverse systems, coefficient exact sequence and Hochschild–Serre for finite étale covers; extend to the finite proper-curve finiteness theorem needed here rather than interpreting the definition as finiteness.

Consumers: [R18.4/finite-cohomology](#r18.4-finite-cohomology), [R18.4/integral-cohomology-control](#r18.4-integral-cohomology-control), [R18.4/finite-level-descent](#r18.4-finite-level-descent).

**`ClassicalAdicEtaleCohomology:H3`.** Supply proper smooth curve trace, Poincaré duality with L∨(1), and integral derived duality. A perfect integral H¹ pairing requires the explicitly stated torsion/vanishing conditions.

Consumers: [R18.4/finite-cohomology](#r18.4-finite-cohomology), [R18.4/integral-cohomology-control](#r18.4-integral-cohomology-control), [R18.4/cohomology-pairing](#r18.4-cohomology-pairing).

**`ClassicalAdicEtaleCohomology:H5`.** Supply algebraic–analytic étale and complex Betti comparison for proper curves with finite coefficient local systems, compatibly in l^n and with Hecke pull-push.

Consumers: [R18.4/finite-cohomology](#r18.4-finite-cohomology).

**`WeightsInEtaleCohomology:R34.5`.** Extend the elliptic-family Sym-power purity node to a rank-two Morita/projector constituent of the higher-dimensional quaternionic PEL abelian family, and the general pure-coefficient proper H¹ theorem. Verify relative splitting projectors and total tensor weight; do not invoke elliptic purity without this extension.

Consumers: [R18.4/quaternion-purity](#r18.4-quaternion-purity).

**`AutomorphicGaloisRepresentations:R19.2`.** Supply the residual Galois-to-acting-Hecke dictionary and the characteristic-zero local–global compatibility excluding Steinberg at distinct-root TW places. Restrict this contract to the early coefficient/eigenspace construction from R18.2 and early R18.4: it must not depend on R18.3/tw-localised-control, R22 patching or R23 modularity, avoiding a declaration-level cycle.

Consumers: [R18.3/tw-localised-control](#r18.3-tw-localised-control), [R18.3/residual-hecke-ideal](#r18.3-residual-hecke-ideal).

**`ReductiveGroupsPartII:RG2.2`.** Supply the GL₂ reduced building as the lattice/norm-class tree, adjacency, q+1 valence and PGL₂ action; R18.5 constructs the analytic reduction and its formal charts, not a second general building.

Consumers: [R18.5/drinfeld-half-plane](#r18.5-drinfeld-half-plane), [R18.5/affinoid-reduction](#r18.5-affinoid-reduction).

**`AdicSpacesPartII:R2`.** Supply gluing/separated quotients and algebraisation for the flat locally finite-type semistable formal curves used in the arithmetic quotient; extend the existing admissible-formal/generic-fibre machinery as AdicSpacesPartII Part II where quotient representability is not yet stated.

Consumers: [R18.5/arithmetic-quotient](#r18.5-arithmetic-quotient).

**`NeronModelsAndSemistableAbelianVarieties:R11.4`.** Supply the semistable Jacobian graph character lattice, thickness-weighted monodromy pairing, component-group cokernel and Hecke/degeneracy functoriality. R18.5 only identifies this generic graph/lattice with its arithmetic tree quotient.

Consumers: [R18.5/character-monodromy](#r18.5-character-monodromy).

**`tauceti:TauCetiRoadmap/StableReduction#layer-0-relative-curves-and-extensions-of-dvrs`.** Import the existing upstream relative-curve/DVR extension and descent framework, with unramified versus ramified base change distinguished.

Consumers: [R18.2/coarse-model](#r18.2-coarse-model).

**`tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.** Import the existing node/normalization and dual multigraph API, including thickness, branches, loops and repeated edges; do not replan it.

Consumers: [R18.5/drinfeld-formal-model](#r18.5-drinfeld-formal-model), [R18.5/tree-dual-graph](#r18.5-tree-dual-graph).

**`tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.** Import regular-surface codimension-two extension and divisor Cartier/norm tools. At the node both multiplication factors can be nonunits; extend the generic/smooth-locus determinant across codimension two.

Consumers: [R18.2/qfactorial-model](#r18.2-qfactorial-model), [R18.2/integral-kodaira-spencer](#r18.2-integral-kodaira-spencer).

**`tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.** Import the regular proper model, relative minimality and the uniqueness of the minimal regular model for positive generic genus (Layer 5), used for the fine models of genus at least 2. Layer 5 does not state finite group quotients or formal algebraisation: the effective finite quotient is requested from PELModuli:M4 and the algebraisation of proper formal curves from AdicSpacesPartII:R2.

Consumers: [R18.2/carayol-split-model](#r18.2-carayol-split-model), [R18.2/regular-model-tower](#r18.2-regular-model-tower), [R18.5/arithmetic-quotient](#r18.5-arithmetic-quotient).

**`tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion`.** Import graph/Picard numerical compatibility; the full generic Jacobian monodromy theorem is specifically requested from R11.4.

Consumers: [R18.5/character-monodromy](#r18.5-character-monodromy).

**`tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`.** Import existing line/divisor/Picard degree and base-change maps; require the rational-line and finite norm extension from the assigned arithmetic owner rather than inventing it here.

Consumers: [R18.2/arithmetic-hodge-line](#r18.2-arithmetic-hodge-line).

**`ModularCurvesPartII:R12.2`.** Import the rational split modular-curve moduli and compactification with compatible tame-level conventions; this is outside the compact division-prime theorem.

Consumers: [R18.5/rational-uniformisation](#r18.5-rational-uniformisation).

## Closure ledger

Planning coverage means each target has a prerequisite route ending in a library,
an imported node or a named obligation. It does not mean those obligations have
been proved. No layer is closed. The following gaps and per-layer refinements
are part of the contract.

### H0 proof and signature gaps

**Arbitrary-prime DP scheme refinement.** DP2.1 constructs an algebraic space at full level; BHW§5.1.2 uses a μ_N scheme. The passage to μ_N fine moduli and a schematic arbitrary-prime model needs a precise representability/ample argument over ℤ_(p), with p=2 and ramified p retained. Good-prime M2 or C5 open-quasiprojectivity does not prove it at bad primes. Until this is supplied H2’s global object is an algebraic space, and scheme-only formal/adic consumers use étale scheme charts with explicit descent.

Consumers: [H2/dp-integral-model](#h2-dp-integral-model), [H2/hasse-formal-domains](#h2-hasse-formal-domains).

**Integral Γ₀ annihilator and closure comparison.** The finite-flat O-stable isotropic rank condition defines the naive integral level functor. Transcribe the precise ideal-annihilator/local-model condition for the chosen ramified polarization class and prove which flat closure, if any, agrees on the ordinary locus used downstream. A generic free O/p^n basis and the rank count alone do not identify this integral model. The source’s Definition5.4 is generic and does not close this integral refinement.

Consumers: [H4/integral-gamma0](#h4-integral-gamma0).

**Hecke polarization descent proof interior.** BHW Lemma8.22 invokes Kisin–Lai§1.9. The cb polarization module and dual-isogeny diagram have been transcribed, but the integral isotropy/elementary-divisor argument and its exact finite-flat hypotheses still need that proof. Supply it before using a general O-stable subgroup in the Hecke construction.

Consumers: [H3/hilbert-hecke-isogenies](#h3-hilbert-hecke-isogenies).

**Taylor local input and structured Honda–Tate realization.** Taylor Lemmas1.2–1.3 are read, but their previously chosen CM characters, auxiliary-prime data and precise ordinary/multiplicative local hypotheses are not yet a closed typed input list. The ordinary construction also uses Honda–Tate with O-action and an ordered polarization. The reviewed AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate node supplies the underlying simple isogeny class, with its own Honda existence proof gap. Request its structured ordinary realization with O-action and ordered polarization from F3 and the A2/A3 interfaces; H6 only specializes that output. No unconditional realization of arbitrary residual modules is claimed.

Consumers: [H6/hilbert-finite-local-points](#h6-hilbert-finite-local-points), [H6/moret-bailly-input-export](#h6-moret-bailly-input-export).

**Allen supersingular and ordinary local pairing checks.** Published pp.1104–1105 reduce the second residual representation to the two finite-flat types. Close the use of Lemma7.1.8 and its connected–étale orientation, choose a compatible good supersingular D and track its actual Frobenius polynomial over k(w), and verify that unramified extensions preserve the selected paired component. The printed supersingular scalar is insufficient for an arbitrary D and residue degree; the ordinary residual extension uses 𝔽_ℓ₂. The negative extension-class lift must be the exact Lemma7.2.2/A4 lift, not a generic torsion realization hypothesis.

Consumers: [H6/allen-finite-local-points](#h6-allen-finite-local-points), [H6/moret-bailly-input-export](#h6-moret-bailly-input-export).

**Carayol descent field in the finite-level bridge.** YZ Proposition4.4 states a connected comparison “over K”; K is not identified in the immediately preceding passage. Restore its precise definition and finite/unramified field, descent cocycle and U^p dependence from Carayol before exporting an integral comparison to R18.2. The present R18.1 geometric connected comparison is over a common algebraic closure, with n supported at p and prime to d_B.

Consumers: [R18.1/yz-component-comparison](#r18.1-yz-component-comparison).

**Consumers of the corrected connected unit limit.** BHW Lemma8.20 has a false injection step and false projection stabilization at p=2, exhibited here. The finite inverse limit and eventual stable IMAGE groups are proved by the corrected uniform-bound argument. S5/O4 must use those images or prove a separate geometric replacement before treating Δ_∞ as the full finite group Δ_n. This packet does not edit their nodes or infer a full-tower finite quotient.

Consumers: [H4/connected-limit-finiteness](#h4-connected-limit-finiteness).

**Prototype signatures requiring unavailable supplier carriers.** The suggested file gives native fractional-ideal, trace, congruence-unit, residue-matrix and quotient signatures. Relative abelian schemes/duals, ordered sheaves, algebraic-group Shimura data/canonical models, algebraic spaces and finite-flat moduli have no located pinned carrier matching the requested suppliers. Their exact API/test names and mathematical contracts are listed in the file’s omission ledger, without assumed theorem fields or dummy objects. Replace each omitted contract with its actual supplier-carrier signature as those interfaces become available.

Consumers: [H0/polarization-lattice](#h0-polarization-lattice), [H0/integral-trace-family](#h0-integral-trace-family), [H1/ordered-polarization-module](#h1-ordered-polarization-module), [H1/symmetric-polarizations](#h1-symmetric-polarizations), [H1/c-polarization](#h1-c-polarization), [H1/hilbert-pel-instance](#h1-hilbert-pel-instance), [H1/tame-level-functors](#h1-tame-level-functors), [H1/linear-weil-pairing](#h1-linear-weil-pairing), [H2/dp-local-model](#h2-dp-local-model), [H2/dp-integral-model](#h2-dp-integral-model), [H2/rapoport-locus](#h2-rapoport-locus), [H2/hilbert-hasse-ideal](#h2-hilbert-hasse-ideal), [H2/hasse-formal-domains](#h2-hasse-formal-domains), [H3/congruence-units](#h3-congruence-units), [H3/congruence-square-image](#h3-congruence-square-image), [H3/polarization-unit-action](#h3-polarization-unit-action), [H3/tame-delta](#h3-tame-delta), [H4/hybrid-full-level](#h4-hybrid-full-level), [H4/pairing-multiplier](#h4-pairing-multiplier), [H4/geometric-full-level](#h4-geometric-full-level), [H4/arithmetic-full-level](#h4-arithmetic-full-level), [H4/integral-gamma0](#h4-integral-gamma0), [H4/connected-unit-groups](#h4-connected-unit-groups), [H4/residue-component-group](#h4-residue-component-group), [H4/effective-level-groups](#h4-effective-level-groups), [H4/diagonal-level-group](#h4-diagonal-level-group), [H4/projective-level-group](#h4-projective-level-group), [H4/level-scalar-kernel](#h4-level-scalar-kernel), [H6/torsion-isom-torsor](#h6-torsion-isom-torsor), [H6/simultaneous-torsion-twist](#h6-simultaneous-torsion-twist), [H6/allen-elliptic-twists](#h6-allen-elliptic-twists), [H6/allen-restriction-moduli](#h6-allen-restriction-moduli), [R18.1/quaternionic-datum](#r18.1-quaternionic-datum), [R18.1/canonical-quaternionic-curve](#r18.1-canonical-quaternionic-curve), [R18.1/yz-bridge-groups](#r18.1-yz-bridge-groups), [R18.1/yz-pel-instance](#r18.1-yz-pel-instance).

### H0 layer completion requirements

**`HilbertModularVarietiesAndShimuraCurves:H0` — planned.** Every source target in the accepted RS-23 keeps has a node. Supplier imports are planned interfaces, not implementation claims.

- Prototype signatures requiring unavailable supplier carriers: The suggested file gives native fractional-ideal, trace, congruence-unit, residue-matrix and quotient signatures. Relative abelian schemes/duals, ordered sheaves, algebraic-group Shimura data/canonical models, algebraic spaces and finite-flat moduli have no located pinned carrier matching the requested suppliers. Their exact API/test names and mathematical contracts are listed in the file’s omission ledger, without assumed theorem fields or dummy objects. Replace each omitted contract with its actual supplier-carrier signature as those interfaces become available.

**`HilbertModularVarietiesAndShimuraCurves:H1` — planned.** Every source target in the accepted RS-23 keeps has a node. Supplier imports are planned interfaces, not implementation claims.

- Prototype signatures requiring unavailable supplier carriers: The suggested file gives native fractional-ideal, trace, congruence-unit, residue-matrix and quotient signatures. Relative abelian schemes/duals, ordered sheaves, algebraic-group Shimura data/canonical models, algebraic spaces and finite-flat moduli have no located pinned carrier matching the requested suppliers. Their exact API/test names and mathematical contracts are listed in the file’s omission ledger, without assumed theorem fields or dummy objects. Replace each omitted contract with its actual supplier-carrier signature as those interfaces become available.
- AbelianSchemesAndArithmeticModuli:A1: Relative abelian-scheme/group-over-base carrier, endomorphism sheaf and real-multiplication action, base change and rigidity for the N≥4 Hilbert tame marking. Reuse the pinned Scheme and Tau Ceti group-object/abelian-variety carriers; an abelian variety over a field is not yet this relative object.
- AbelianSchemesAndArithmeticModuli:A2: Dual abelian scheme with biduality, symmetric O-linear Hom sheaf, positive polarizations from ample bundles, Rosati fixing O, and pullback compatibility. The existing rosati-involution node is imported, but alone does not provide this relative dual/polarization package.
- AbelianSchemesAndArithmeticModuli:A3: Serre tensor A⊗_O c for invertible modules; Cartier-dual finite-flat torsion and perfect Weil pairing; quotients by finite locally free O-stable subgroups and dual-isogeny/polarization descent. Supply all pairing twists and quotient base-change maps used here, including the μ_N versus marked-point isogeny comparison.
- AbelianSchemesAndArithmeticModuli:A4: Hodge exact sequence with O-action and the Lie characteristic polynomial, polarized O-linear Grothendieck–Messing comparison with the Hilbert local model, and Serre–Tate deformation equivalence retaining endomorphisms and c-polarization. For the ordinary H6 construction include the lift of the finite extension class with its sign and local character twists.

**`HilbertModularVarietiesAndShimuraCurves:H2` — planned.** Every source target in the accepted RS-23 keeps has a node. Supplier imports are planned interfaces, not implementation claims.

- Arbitrary-prime DP scheme refinement: DP2.1 constructs an algebraic space at full level; BHW§5.1.2 uses a μ_N scheme. The passage to μ_N fine moduli and a schematic arbitrary-prime model needs a precise representability/ample argument over ℤ_(p), with p=2 and ramified p retained. Good-prime M2 or C5 open-quasiprojectivity does not prove it at bad primes. Until this is supplied H2’s global object is an algebraic space, and scheme-only formal/adic consumers use étale scheme charts with explicit descent.
- Prototype signatures requiring unavailable supplier carriers: The suggested file gives native fractional-ideal, trace, congruence-unit, residue-matrix and quotient signatures. Relative abelian schemes/duals, ordered sheaves, algebraic-group Shimura data/canonical models, algebraic spaces and finite-flat moduli have no located pinned carrier matching the requested suppliers. Their exact API/test names and mathematical contracts are listed in the file’s omission ledger, without assumed theorem fields or dummy objects. Replace each omitted contract with its actual supplier-carrier signature as those interfaces become available.
- AbelianSchemesAndArithmeticModuli:A4: Hodge exact sequence with O-action and the Lie characteristic polynomial, polarized O-linear Grothendieck–Messing comparison with the Hilbert local model, and Serre–Tate deformation equivalence retaining endomorphisms and c-polarization. For the ordinary H6 construction include the lift of the finite extension class with its sign and local character twists.
- AlgebraicModuliForArithmeticGeometry:R09.1: Relative rank-g Grassmannian and invariant-subbundle equations: closed representability of O-stability and the self-orthogonal wedge condition, with universal subbundle and arbitrary base change. No abelian moduli construction is requested here.
- AlgebraicModuliForArithmeticGeometry:R09.3: Effective finite étale descent of quasi-projective schemes, actual abelian families, endomorphisms and ordered polarizations under a finite, possibly NONCOMMUTATIVE symplectic Isom-torsor, retaining a descended ample power and universal moduli property. Also algebraic-space descent from the fine full-tame DP presentation. Quasi-coherent module descent and R09.4 commutative torsor twists alone do not supply this.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6: Grothendieck–Messing with O-endomorphism/polarization structures at p=2 and ramified p, and the finite-flat residual torsion comparison in Allen Lemma7.1.8: supersingular induced type or the indicated ordinary finite H_f extension, with connected–étale orientation. Do not infer every local residual module is realizable.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2: Per accepted RT-AREA-padic-1/26, generic BT₁ Ha=det(V*) in (detω)^(p−1), its base-change law and intrinsic ordinary criterion at EVERY p including2; polarized O-linear ordinary decomposition sufficient for ω to be rank one over O⊗k. Generic Fargues LF and intrinsic BT₁ Hodge–Tate map remain here; H2 only specializes Ha and its ideal, and T0 owns the boundary extension downstream.

**`HilbertModularVarietiesAndShimuraCurves:H3` — planned.** Every source target in the accepted RS-23 keeps has a node. Supplier imports are planned interfaces, not implementation claims.

- Hecke polarization descent proof interior: BHW Lemma8.22 invokes Kisin–Lai§1.9. The cb polarization module and dual-isogeny diagram have been transcribed, but the integral isotropy/elementary-divisor argument and its exact finite-flat hypotheses still need that proof. Supply it before using a general O-stable subgroup in the Hecke construction.
- Prototype signatures requiring unavailable supplier carriers: The suggested file gives native fractional-ideal, trace, congruence-unit, residue-matrix and quotient signatures. Relative abelian schemes/duals, ordered sheaves, algebraic-group Shimura data/canonical models, algebraic spaces and finite-flat moduli have no located pinned carrier matching the requested suppliers. Their exact API/test names and mathematical contracts are listed in the file’s omission ledger, without assumed theorem fields or dummy objects. Replace each omitted contract with its actual supplier-carrier signature as those interfaces become available.
- AbelianSchemesAndArithmeticModuli:A3: Serre tensor A⊗_O c for invertible modules; Cartier-dual finite-flat torsion and perfect Weil pairing; quotients by finite locally free O-stable subgroups and dual-isogeny/polarization descent. Supply all pairing twists and quotient base-change maps used here, including the μ_N versus marked-point isogeny comparison.
- AlgebraicModuliForArithmeticGeometry:R09.5: Finite effective unit-group quotients in the algebraic-space category, identification of free finite constant group actions with finite étale torsors, their Cartesian base changes and compatible characteristic-zero canonical comparisons. State the scheme/descent hypotheses rather than asserting a universal family on arbitrary coarse quotients; compare the pre-existing finite étale quotient owner.

**`HilbertModularVarietiesAndShimuraCurves:H4` — planned.** Every source target in the accepted RS-23 keeps has a node. Supplier imports are planned interfaces, not implementation claims.

- Integral Γ₀ annihilator and closure comparison: The finite-flat O-stable isotropic rank condition defines the naive integral level functor. Transcribe the precise ideal-annihilator/local-model condition for the chosen ramified polarization class and prove which flat closure, if any, agrees on the ordinary locus used downstream. A generic free O/p^n basis and the rank count alone do not identify this integral model. The source’s Definition5.4 is generic and does not close this integral refinement.
- Consumers of the corrected connected unit limit: BHW Lemma8.20 has a false injection step and false projection stabilization at p=2, exhibited here. The finite inverse limit and eventual stable IMAGE groups are proved by the corrected uniform-bound argument. S5/O4 must use those images or prove a separate geometric replacement before treating Δ_∞ as the full finite group Δ_n. This packet does not edit their nodes or infer a full-tower finite quotient.
- Prototype signatures requiring unavailable supplier carriers: The suggested file gives native fractional-ideal, trace, congruence-unit, residue-matrix and quotient signatures. Relative abelian schemes/duals, ordered sheaves, algebraic-group Shimura data/canonical models, algebraic spaces and finite-flat moduli have no located pinned carrier matching the requested suppliers. Their exact API/test names and mathematical contracts are listed in the file’s omission ledger, without assumed theorem fields or dummy objects. Replace each omitted contract with its actual supplier-carrier signature as those interfaces become available.
- AbelianSchemesAndArithmeticModuli:A3: Serre tensor A⊗_O c for invertible modules; Cartier-dual finite-flat torsion and perfect Weil pairing; quotients by finite locally free O-stable subgroups and dual-isogeny/polarization descent. Supply all pairing twists and quotient base-change maps used here, including the μ_N versus marked-point isogeny comparison.
- AlgebraicModuliForArithmeticGeometry:R09.5: Finite effective unit-group quotients in the algebraic-space category, identification of free finite constant group actions with finite étale torsors, their Cartesian base changes and compatible characteristic-zero canonical comparisons. State the scheme/descent hypotheses rather than asserting a universal family on arbitrary coarse quotients; compare the pre-existing finite étale quotient owner.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1: General finite locally free subgroup-scheme/Cartier-dual carrier with rank, O-action, isotropy and base change used for integral Γ₀ levels. The p-divisible-group and Raynaud specialized nodes do not by themselves supply this subgroup parameter functor.

**`HilbertModularVarietiesAndShimuraCurves:H5` — planned.** Every source target in the accepted RS-23 keeps has a node. Supplier imports are planned interfaces, not implementation claims.

- ModularCurvesPartII:R12.2: The canonical Q modular curve, its tame μ_N/point-level comparison by quotient and Cartier duality, finite-flat Γ₀ levels and rational split-quaternion identification, all with matching field, marking and effective stabilizers.

**`HilbertModularVarietiesAndShimuraCurves:H6` — planned.** Every source target in the accepted RS-23 keeps has a node. Supplier imports are planned interfaces, not implementation claims.

- Taylor local input and structured Honda–Tate realization: Taylor Lemmas1.2–1.3 are read, but their previously chosen CM characters, auxiliary-prime data and precise ordinary/multiplicative local hypotheses are not yet a closed typed input list. The ordinary construction also uses Honda–Tate with O-action and an ordered polarization. The reviewed AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate node supplies the underlying simple isogeny class, with its own Honda existence proof gap. Request its structured ordinary realization with O-action and ordered polarization from F3 and the A2/A3 interfaces; H6 only specializes that output. No unconditional realization of arbitrary residual modules is claimed.
- Allen supersingular and ordinary local pairing checks: Published pp.1104–1105 reduce the second residual representation to the two finite-flat types. Close the use of Lemma7.1.8 and its connected–étale orientation, choose a compatible good supersingular D and track its actual Frobenius polynomial over k(w), and verify that unramified extensions preserve the selected paired component. The printed supersingular scalar is insufficient for an arbitrary D and residue degree; the ordinary residual extension uses 𝔽_ℓ₂. The negative extension-class lift must be the exact Lemma7.2.2/A4 lift, not a generic torsion realization hypothesis.
- Prototype signatures requiring unavailable supplier carriers: The suggested file gives native fractional-ideal, trace, congruence-unit, residue-matrix and quotient signatures. Relative abelian schemes/duals, ordered sheaves, algebraic-group Shimura data/canonical models, algebraic spaces and finite-flat moduli have no located pinned carrier matching the requested suppliers. Their exact API/test names and mathematical contracts are listed in the file’s omission ledger, without assumed theorem fields or dummy objects. Replace each omitted contract with its actual supplier-carrier signature as those interfaces become available.
- AbelianSchemesAndArithmeticModuliPartII:F3: Import the reviewed honda-tate node for the underlying finite-field isogeny class. Extend its realization contract to the specified O-action, ordinary slopes and ordered polarization used by Taylor Lemma1.3; the unpolarized simple-class classification alone does not supply this structured witness. Keep Honda existence proof with this owner.
- AbelianSchemesAndArithmeticModuli:A4: Hodge exact sequence with O-action and the Lie characteristic polynomial, polarized O-linear Grothendieck–Messing comparison with the Hilbert local model, and Serre–Tate deformation equivalence retaining endomorphisms and c-polarization. For the ordinary H6 construction include the lift of the finite extension class with its sign and local character twists.
- AlgebraicModuliForArithmeticGeometry:R09.3: Effective finite étale descent of quasi-projective schemes, actual abelian families, endomorphisms and ordered polarizations under a finite, possibly NONCOMMUTATIVE symplectic Isom-torsor, retaining a descended ample power and universal moduli property. Also algebraic-space descent from the fine full-tame DP presentation. Quasi-coherent module descent and R09.4 commutative torsor twists alone do not supply this.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6: Grothendieck–Messing with O-endomorphism/polarization structures at p=2 and ramified p, and the finite-flat residual torsion comparison in Allen Lemma7.1.8: supersingular induced type or the indicated ordinary finite H_f extension, with connected–étale orientation. Do not infer every local residual module is realizable.
- AbelianSchemesAndArithmeticModuli:A5: Algebraization of the trace-polarized complex/real Hilbert torus, the homological lattice period map and its compatibility with dual/tame/pairing levels. Supply the real involution and polarization-sign computation used to identify paired torsion frames.

**`HilbertModularVarietiesAndShimuraCurves:R18.1` — planned.** Every source target in the accepted RS-23 keeps has a node. Supplier imports are planned interfaces, not implementation claims.

- Carayol descent field in the finite-level bridge: YZ Proposition4.4 states a connected comparison “over K”; K is not identified in the immediately preceding passage. Restore its precise definition and finite/unramified field, descent cocycle and U^p dependence from Carayol before exporting an integral comparison to R18.2. The present R18.1 geometric connected comparison is over a common algebraic closure, with n supported at p and prime to d_B.
- Prototype signatures requiring unavailable supplier carriers: The suggested file gives native fractional-ideal, trace, congruence-unit, residue-matrix and quotient signatures. Relative abelian schemes/duals, ordered sheaves, algebraic-group Shimura data/canonical models, algebraic spaces and finite-flat moduli have no located pinned carrier matching the requested suppliers. Their exact API/test names and mathematical contracts are listed in the file’s omission ledger, without assumed theorem fields or dummy objects. Replace each omitted contract with its actual supplier-carrier signature as those interfaces become available.
- ModularCurvesPartII:R12.2: The canonical Q modular curve, its tame μ_N/point-level comparison by quotient and Cartier duality, finite-flat Γ₀ levels and rational split-quaternion identification, all with matching field, marking and effective stabilizers.
- ReductiveGroupsPartII:RG2.0a: Restriction of scalars, central algebraic-group quotients and fibre products on existing carriers, including Res B×, its norm-one derived group and the quotient (B××E×)/{(a⁻¹,a)} with descended norm/conjugation maps.
- tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion: Existing quaternion algebra, conjugation, reduced norm/trace, real matrix splitting and CM scalar extension comparison used for the quaternionic datum and PEL bridge. Import upstream rather than proposing another quaternion algebra.
- ShimuraVarieties:V8: Canonical finite-level models and complex uniformization over the D3 reflex field for the D4 SV1–SV3 quaternionic datum, whose central weight need not be Q-rational; small-level effective quotient, properness and datum-map descent. Existing finite-level-maps/datum-functoriality nodes are used, but do not alone state this canonical-model endpoint.
- ReductiveGroupsPartII:RG2.0: Real/local points and their topology on the imported quaternion and restriction-of-scalars algebraic groups, including arithmetic subgroup actions and their scalar kernels.
- ReductiveGroupsPartII:RG2.3: Integral quaternion order levels (1+NÔ_B)×, their compact openness and nested-level comparison, with effective rational scalar stabilizers computed separately.

### R18.2 proof and signature gaps

**Ramified relative Kodaira–Spencer.** Construct and prove the saturated strict O_v-relative crystal/Hodge filtration at ramified F_v, with determinant matching the absolute filtered crystal. YZ’s raw τ-quotient rank argument is invalid; the node is a target with this unproved repair, not an established arbitrary-ramification theorem.

Consumers: [R18.2/integral-kodaira-spencer](#r18.2-integral-kodaira-spencer).

**Ramified bridge determinant.** Prove the integral saturated determinant tensor comparison at ramified F_v and hence the intended extension of Corollary 5.5. The unramified direct-summand cancellation is planned; the printed Hom_OE=Hom_OB deformation argument is false.

Consumers: [R18.2/bridge-filtered-crystal](#r18.2-bridge-filtered-crystal), [R18.2/bridge-determinant](#r18.2-bridge-determinant).

**Khare Lemma 2.2 exact statement.** The routed /209 statement is not supplied by KW, which only describes its use. Read and collate Lemma 2.2 in Duke 134 (2006), 557–589, DOI 10.1215/S0012-7094-06-13434-8. The accessible arXiv math/0504080v1 has a different title and Proposition 2.2, so cannot certify the requested lemma. Project Euclid returned HTML rather than the final PDF. Separate automatic p>3/unramified neatness, actual auxiliary smallness, and the degree argument removing neatness restrictions; avoid the R23→R18 cycle.

Consumers: [R18.3/neatness-base-change](#r18.3-neatness-base-change).

**Indefinite integral Ihara and saturation.** Prove the exact mod-l injectivity/saturation statement consumed by R22 for the coefficient system and image hypothesis in use. Manning–Shotton (arXiv:1907.06043; Math. Ann. 379 (2021), Theorem 1.1) assumes l>2 and large residual image, with an extra exceptional l=5 condition; its patching proof cannot be imported upstream of R22. Definite KW Lemma 7.1 does not prove it. Only the actual degeneracy construction, traces and degree are asserted in this pass.

Consumers: [R18.4/cohomological-degeneracy](#r18.4-cohomological-degeneracy).

**Residual cohomological vanishing.** Verify H⁰(L_k)_m=H⁰(L_k∨(1))_m=0 for each quaternionic weight/level residual system exported to R22. Until this is checked the integral-freeness theorem is used under its two explicit vanishing hypotheses.

Consumers: [R18.4/integral-cohomology-control](#r18.4-integral-cohomology-control).

**Missing formal carriers in suggested Lean.** At the pinned baseline there are no strict quaternionic p-divisible moduli, formal Drinfeld schemes, PEL universal family or integral étale-cohomology carrier. The suggested file gives actual elementary double-coset, group-ring/level, norm-twist and polynomial-kernel prototypes, and the underlying weight module, the point set of Ω_K and the counting tests, where typeable; it records each omitted definition, API, test and theorem by its packet name and full statement. These entries are signature obligations, not Lean declarations or fake proposition fields. Obtain the supplier carriers, then replace the ledger entries with typed signatures and rerun at both pins.

Consumers: [R18.2/quaternion-pel-instance](#r18.2-quaternion-pel-instance), [R18.2/effective-small-level](#r18.2-effective-small-level), [R18.2/quaternion-pdiv-tower](#r18.2-quaternion-pdiv-tower), [R18.2/connected-pel-comparison](#r18.2-connected-pel-comparison), [R18.2/finite-pel-comparison](#r18.2-finite-pel-comparison), [R18.2/carayol-split-model](#r18.2-carayol-split-model), [R18.2/regular-model-tower](#r18.2-regular-model-tower), [R18.2/coarse-model](#r18.2-coarse-model), [R18.2/hecke-integral-extension](#r18.2-hecke-integral-extension), [R18.2/qfactorial-model](#r18.2-qfactorial-model), [R18.2/arithmetic-hodge-line](#r18.2-arithmetic-hodge-line), [R18.2/integral-pdiv](#r18.2-integral-pdiv), [R18.2/integral-kodaira-spencer](#r18.2-integral-kodaira-spencer), [R18.2/bridge-tate-comparison](#r18.2-bridge-tate-comparison), [R18.2/bridge-integral-model](#r18.2-bridge-integral-model), [R18.2/bridge-point-extension](#r18.2-bridge-point-extension), [R18.2/bridge-filtered-crystal](#r18.2-bridge-filtered-crystal), [R18.2/bridge-determinant](#r18.2-bridge-determinant), [R18.3/definite-class-set](#r18.3-definite-class-set), [R18.3/quaternion-weight](#r18.3-quaternion-weight), [R18.3/definite-specialisation](#r18.3-definite-specialisation), [R18.3/neatness-base-change](#r18.3-neatness-base-change), [R18.3/integral-pairing](#r18.3-integral-pairing), [R18.3/split-hecke-normalisation](#r18.3-split-hecke-normalisation), [R18.3/norm-branch](#r18.3-norm-branch), [R18.3/definite-degeneracy](#r18.3-definite-degeneracy), [R18.3/definite-jl](#r18.3-definite-jl), [R18.3/isotropy-exponent](#r18.3-isotropy-exponent), [R18.3/base-change-annihilator](#r18.3-base-change-annihilator), [R18.3/tw-level](#r18.3-tw-level), [R18.3/tw-stabilisers](#r18.3-tw-stabilisers), [R18.3/tw-freeness](#r18.3-tw-freeness), [R18.3/tw-localised-control](#r18.3-tw-localised-control), [R18.3/dyadic-norm-twist](#r18.3-dyadic-norm-twist), [R18.3/dyadic-hecke-twist](#r18.3-dyadic-hecke-twist), [R18.3/dyadic-sign-extension](#r18.3-dyadic-sign-extension), [R18.3/residual-hecke-ideal](#r18.3-residual-hecke-ideal), [R18.4/quaternion-local-systems](#r18.4-quaternion-local-systems), [R18.4/finite-cohomology](#r18.4-finite-cohomology), [R18.4/integral-cohomology-control](#r18.4-integral-cohomology-control), [R18.4/cohomology-pairing](#r18.4-cohomology-pairing), [R18.4/cohomological-eigenspaces](#r18.4-cohomological-eigenspaces), [R18.4/definite-indefinite-comparison](#r18.4-definite-indefinite-comparison), [R18.4/cohomological-degeneracy](#r18.4-cohomological-degeneracy), [R18.4/quaternion-purity](#r18.4-quaternion-purity), [R18.4/finite-level-descent](#r18.4-finite-level-descent), [R18.5/drinfeld-half-plane](#r18.5-drinfeld-half-plane), [R18.5/affinoid-reduction](#r18.5-affinoid-reduction), [R18.5/drinfeld-formal-model](#r18.5-drinfeld-formal-model), [R18.5/special-formal-moduli](#r18.5-special-formal-moduli), [R18.5/drinfeld-representability](#r18.5-drinfeld-representability), [R18.5/height-and-descent](#r18.5-height-and-descent), [R18.5/arithmetic-quotient](#r18.5-arithmetic-quotient), [R18.5/totally-real-uniformisation](#r18.5-totally-real-uniformisation), [R18.5/rational-uniformisation](#r18.5-rational-uniformisation), [R18.5/tower-uniformisation](#r18.5-tower-uniformisation), [R18.5/tree-dual-graph](#r18.5-tree-dual-graph), [R18.5/character-monodromy](#r18.5-character-monodromy).

**Cross-part connected-comparison descent over K.** R18.1/yz-component-comparison supplies the comparison over a common algebraic closure, with finite n supported at p and prime to d_B. It explicitly leaves Carayol’s descent field, cocycle and tame-level dependence unresolved. R18.2/connected-pel-comparison and /finite-pel-comparison still target descent over K=completion of F_v^ur; this stronger output is not provided by the geometric supplier. Restore and verify Carayol §§4.2–4.5 with the exact norm-one quotient and finite-level action. Until then the integral transfer and totally-real uniformisation routes that consume this descent remain conditional; BZ’s uniformisation theorem itself is unchanged.

Consumers: [R18.2/connected-pel-comparison](#r18.2-connected-pel-comparison), [R18.2/finite-pel-comparison](#r18.2-finite-pel-comparison), [R18.5/totally-real-uniformisation](#r18.5-totally-real-uniformisation).

### R18.2 layer completion requirements

**`HilbertModularVarietiesAndShimuraCurves:R18.2` — planned.** Every target decomposed at target level; source repairs and unbuilt supplier/signature conditions remain explicit. No implementation claimed. The stage’s import of the Hilbert compactifications from ShimuraCompactifications:C6 has no consumer among these quaternionic targets, since the curves are compact (no cusp boundary); no node cites C6.

- Prove the ramified strict relative filtration and saturated bridge determinant repairs; replace missing formal-carrier signature ledger entries.
- Cross-part connected-comparison descent over K: R18.1/yz-component-comparison supplies the comparison over a common algebraic closure, with finite n supported at p and prime to d_B. It explicitly leaves Carayol’s descent field, cocycle and tame-level dependence unresolved. R18.2/connected-pel-comparison and /finite-pel-comparison still target descent over K=completion of F_v^ur; this stronger output is not provided by the geometric supplier. Restore and verify Carayol §§4.2–4.5 with the exact norm-one quotient and finite-level action. Until then the integral transfer and totally-real uniformisation routes that consume this descent remain conditional; BZ’s uniformisation theorem itself is unchanged.

**`HilbertModularVarietiesAndShimuraCurves:R18.3` — planned.** Every target decomposed at target level; source repairs and unbuilt supplier/signature conditions remain explicit. No implementation claimed.

- Collate Khare Lemma 2.2 and its exact degree/smallness conclusion; obtain AF.5 fixed-central-character carrier extension and typed integral adelic/weight signatures.

**`HilbertModularVarietiesAndShimuraCurves:R18.4` — planned.** Every target decomposed at target level; source repairs and unbuilt supplier/signature conditions remain explicit. No implementation claimed.

- Prove residual H⁰ vanishings and the precise indefinite integral Ihara/saturation statement without a patching cycle; obtain generalized R34 projector purity and actual cohomology carriers.

**`HilbertModularVarietiesAndShimuraCurves:R18.5` — planned.** Every target decomposed at target level; source repairs and unbuilt supplier/signature conditions remain explicit. No implementation claimed.

- Obtain generic formal quotient/algebraisation and PEL basic uniformisation supplier extensions, and replace the formal-moduli/tower signature ledger with typed statements.
- Cross-part connected-comparison descent over K: R18.1/yz-component-comparison supplies the comparison over a common algebraic closure, with finite n supported at p and prime to d_B. It explicitly leaves Carayol’s descent field, cocycle and tame-level dependence unresolved. R18.2/connected-pel-comparison and /finite-pel-comparison still target descent over K=completion of F_v^ur; this stronger output is not provided by the geometric supplier. Restore and verify Carayol §§4.2–4.5 with the exact norm-one quotient and finite-level action. Until then the integral transfer and totally-real uniformisation routes that consume this descent remain conditional; BZ’s uniformisation theorem itself is unchanged.

**`HilbertModularVarietiesAndShimuraCurves:R18.6` — source decomposed.** Consumer/export index only: no new mathematical declarations or planets. The Allen/Hilbert torsion inputs are supplied by the exact H6/moret-bailly-input-export node, retaining its recorded local-realization gaps.

## Corrected source statements

The node plan uses the reviewed corrections. The part packets preserve the
printed text, version records, searches and independent review evidence. Their
source-issue IDs are part-local: H0/E1 and R18.2/E1 are distinct entries, even
though their stored roadmap prefix is shared. The labels below qualify the part
and link to its evidence; no new source finding is asserted by this assembly.

### H0/E1: error

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--H0.json), Lemma8.20 proof, published p.1775.

**Corrected contract.** The inclusion-induced Δ_n(N)→Δ(N) need not be injective. Replace the cardinality argument by |Δ_n|≤[U:U_N]2^g.

**Reason and impact.** In O=ℤ[√2], ε=1+√2, N=4,p=3, η=ε⁴=17+12√2 is1 modulo4 and−1 modulo3. Its square belongs to A_1 and is killed in Δ(4), but neither root ±η belongs to U_12, so its class in Δ_1(4) is nontrivial. Affects: the proof.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--H0`: Confirmed at published p.1775. Independently computed η=ε⁴=17+12√2, Norm(η)=1, η≡1 mod4 and η≡−1 mod3. The only square roots of η² in F are ±η; neither is 1 mod12. Thus the inclusion-induced map has nonzero kernel. The replacement bound uses U_{p^nN}=U_{p^n}∩U_N and the subgroup square index, not this injection.

### H0/E2: error

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--H0.json), Lemma8.20 statement, published p.1775.

**Corrected contract.** The inverse limit is finite, but projection identifies it eventually with its stable image I_n, not necessarily with all Δ_n. Retain all p and the corrected stable-image statement.

**Reason and impact.** For F=ℚ(√2),p=2,N=5,n≥2, U_{2^n}=⟨ε^{2^n}⟩ and U_{2^n5}=⟨ε^{3·2^n}⟩. Thus Δ_n=ℤ/6 with transition ×2; its inverse limit is ℤ/3, so every projection has proper image. The Pell recurrence and order12 of ε mod5 are checked explicitly. Affects: a stated result.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--H0`: Confirmed at published p.1775, and corrected the printed anchor to the actual displayed assertion. For ε=1+√2, squaring gives b_{m+1}=2a_m b_m with a_m odd, hence v₂(b_m)=m; the mod4 calculation excludes negative-unit congruences. Independently computed order12 mod5. For n≥2 the quotients are Z/6 with ×2 transition; the compatible sequences project to the order-three subgroup and the inverse limit is Z/3. Finiteness survives, eventual surjectivity onto Δ_n does not.

### H0/E3: error

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--H0.json), §8.3.1, published p.1774.

**Corrected contract.** Nonsplitting requires additional hypotheses; keep the two exact sequences without a blanket nonsplitting conclusion.

**Reason and impact.** For F=ℚ,N≥4 the positive unit group is trivial, U_N={1}, E=Γ₀ and the polarization quotients are trivial. The displayed extensions split. Affects: a stated result.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--H0`: Confirmed at published p.1774. F=Q is permitted by the paper: U+={1} and U_N={1} for N≥4, so Δ(N) and Δ(p^nN) are trivial and E=Γ₀=PΓ₀. Both displayed extensions split.

### H0/E4: gap

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--H0.json), §7.2.5 proof of Theorem7.1.11, published p.1105; author p.210.

**Corrected contract.** Choose D with the required local finite-flat type and match its actual Frobenius polynomial. If D is the base change of a trace-zero supersingular curve over 𝔽_l₂, over k(w) the scalar after squaring is (−l₂)^[k(w):𝔽_l₂]. Then choose a common sufficiently divisible unramified degree.

**Reason and impact.** The preceding passage permits a general unramified local field. Squaring Frobenius over residue degree h gives (−l₂)^h, and an arbitrary supersingular D was not shown to have the required scalar at that exact power. The missing residue-degree/choice check affects the presented local proof; a sufficiently divisible unramified extension repairs it once the finite-flat type is matched. Affects: the proof.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--H0`: Confirmed as a local proof gap at published p.1105, not as a counterexample to Theorem7.1.11. For a trace-zero curve over F_l₂, π²=−l₂; after residue extension of degree h, Frob²=(−l₂)^h. The displayed matching equation omits h and does not justify the necessary choice of arbitrary supersingular D. A sufficiently divisible unramified degree can repair the prime-to-l₂ matching; matching the finite-flat local type remains the expressly recorded gap.

### H0/E5: misprint

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--H0.json), §7.2.5 ordinary case, published p.1105; author p.210.

**Corrected contract.** Use the residual coefficient module 𝔽_l₂(ε_l₂χ²) in the H_f extension class.

**Reason and impact.** The two-dimensional residual representation and the preceding ordinary extension class are over 𝔽_l₂; k(w) is the unrelated residue field of the local place. Lemma7.2.2 lifts the residual coefficient module used there. Affects: nothing.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--H0`: Confirmed at published p.1105. The preceding extension and Lemma7.2.2 use the residual coefficient field F_l₂. Replacing it in the later formula by the local residue field k(w) changes the coefficient module without a scalar-extension instruction; the intended correction is F_l₂.

### R18.2/E1: error

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json), §2.3, proof of Theorem 2.7, p. 549 (not p. 550); restated in §1.2, p. 537; Erratum §1, p. 1.

**Corrected contract.** Replace Theorem 2.7 by Erratum Theorem 1 (p. 2): A, A1 and A2 have good reduction over O_K, and the kernel of the O_E-isogeny A1 × A2 → A is the graph of an O_E-isomorphism A1[δ_{E/F}] ≅ A2[δ_{E/F}]. Restrict the introduction's claim (p. 537), that h(Φ1,Φ2) = ½h(A0,τ) 'for any abelian variety A0 with an action by O_E and isogenous to A_Φ1 × A_Φ2', in the same way.

**Reason and impact.** Néron models need not preserve a short exact sequence; authors cite BLR Example8 p190. The corrected theorem is weaker and suffices for main Theorem1.6. Do not assert the original unrestricted theorem disproved by this proof failure. (cc-442dc5) Reclassified to affect a stated result: the published erratum does not prove Theorem 2.7 as printed but replaces it by the weaker Theorem 1 (kernel the graph of an isomorphism A1[δ] → A2[δ]). Theorems 1.1 and 1.6 are unaffected: the erratum (§1) shows that the isogeny used on pp. 576–577 satisfies the weaker hypothesis. Affects: a stated result.

**Correction status.** Published erratum, Annals198(2023)867–878, DOI10.4007/annals.2023.198.2.8; later author revision read.

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--R18.2`: Checked p.549 (proof of Theorem 2.7: the Néron-model exact sequences) and Erratum5.pdf §1, Theorem 1 (kernel the graph of an O_E-isomorphism A1[δ_{E/F}] → A2[δ_{E/F}]). The erratum withdraws the exactness step and proves only the weaker statement, so “a stated result” and the correction are right.

### R18.2/E8: misprint

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json), §4.3, definition of KS_℘ before Theorem 4.10, p. 569.

**Corrected contract.** N_℘ := det W^t_℘ ⊗ det W_℘

**Reason and impact.** The displayed map det W^t→det W^∨⊗ω² gives det W^t⊗det W→ω² after tensoring by det W, not by its dual. Affects: nothing.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--R18.2`: Checked p.569: the displayed map det W^t → det W^∨ ⊗ ω^{⊗2} is a map det W^t ⊗ det W → ω^{⊗2}, so N = det W^t ⊗ det W, as the split-case computation and Corollary 5.5 use.

### R18.2/E9: error

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json), §4.3, proof of Theorem 4.10, division case, p. 570.

**Corrected contract.** The claim holds off the double points of the special fibre, where π is a prime local equation of the reduced special fibre, and on the generic fibre, where both j_i are isomorphisms. There the printed computation gives ω^{-2} = π·N^∨, i.e. N = πω^2 = ω^{⊗2}(−d_{B,℘}); the extraction's 'π^{-1}N^∨' has the wrong power of π. The double points are closed points, of codimension 2, of the regular finite-level models 𝒳_{1,U^p} ⊗ O_K (Theorem 4.5). On such a normal scheme a map of line bundles N → ω^{⊗2}(−d) that is an isomorphism off codimension 2 is an isomorphism. So Theorem 4.10 stands.

**Reason and impact.** The relation alone is insufficient: in O[[x,y]]/(xy−π) at the closed node, x and y are both nonunits. This is a counterexample to the inference, not to the stated Kodaira–Spencer theorem. The proposed extension argument has not been source-closed. (cc-442dc5) Reclassified from gap to error: the printed claim that exactly one of j1, j2 is an isomorphism at each point is false at the double points of the Mumford special fibre, where both are nonunits. The correction gives the extension argument; Theorem 4.10 stands. Affects: the proof.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--R18.2`: Checked p.570: at a double point of the Mumford special fibre, with complete local ring O[[x,y]]/(xy−π), both j1 and j2 are nonunits, so the printed claim fails there. The correction (N = πω², hence ω^{⊗2}(−d_{B,℘}), off codimension two, then extension on the regular finite-level model) is right, and Theorem 4.10 stands.

### R18.2/E19: misprint

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json), §3.2, proof of Proposition 3.2, p. 554.

**Corrected contract.** The relative dimension is 4g, and the moduli space is M_{4g,d,n}. The same paragraph also writes F′_{U′p}, X′_{0,U′p} and F̃_{0,U′p} for F̃_{U′p}, X′_{1,U′p} and F̃_{U′p}.

**Reason and impact.** [F:Q]=g, [E:Q]=2g, rank_E B'=4, so H1 has Q-rank8g and A has dimension4g. The level condition identifies H1 with that lattice. Affects: nothing.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--R18.2`: Checked p.554: “the relative dimension of A/S is 2g” and M_{2g,d,n}. B′ = B ⊗_F E has Q-dimension 8g, so H_1(A,Q) ≅ V′ has rank 8g and dim A = 4g. The mislabelled functor names are as stated.

### R18.2/E20: misprint

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json), §3.3, 'CM points', p. 558.

**Corrected contract.** X′^{T′} is a single T̂′-orbit: a principal homogeneous space under T̂′ modulo the closure of T′(Q), namely {[z0, t] : t ∈ T̂′}.

**Reason and impact.** In the double quotient, rational torus elements fix the distinguished complex point and act trivially on its adelic orbit after left quotienting. Thus the unquotiented adelic torus action is not free. The exact scheme/tower quotient is a remaining reconciliation task. (cc-442dc5) Reclassified to a misprint that affects nothing: the intended statement is the standard one, that the fixed points form a principal homogeneous space under the quotient of T̂' by the closure of T'(Q). The paper uses only that X'^{T'} is one T̂'-orbit, to fix a point P'. Affects: nothing.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--R18.2`: Checked p.558: “a principal homogenous space of T̂′”. Rational torus elements act trivially on the orbit, so it is a principal homogeneous space only modulo the closure of T′(Q); the paper uses only that it is one orbit. Misprint, affects nothing.

### R18.2/E23: misprint

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json), §4.2, proof of Theorem 4.5, first sentence, p. 564; the slip recurs on p. 565.

**Corrected contract.** Proposition 3.2 in both places.

**Reason and impact.** There is no Theorem 3.2; the regular PEL models at small level are Proposition 3.2 (p554). Affects: nothing.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--R18.2`: Checked pp.564–565: both proofs cite “Theorem 3.2”; §3 has only Proposition 3.2 (the regular PEL model).

### R18.2/E27: misprint

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json), §3.3, proof of Theorem 3.7, p. 559.

**Corrected contract.** ∇(e_z) = (−1, 0)dz = (e_z − ē_z)/(2iy) dz, so dz = −2iy e_z/ē_z under Kodaira–Spencer. |dz| = 2y is unchanged.

**Reason and impact.** With e_z = (−z, 1) and ē_z = (−z̄, 1), ē_z − e_z = (z − z̄, 0) = (2iy, 0), so (ē_z − e_z)/(2iy) = (1, 0) ≠ (−1, 0). Only the absolute value is used. Checked on the page image; the same in arXiv v3. Affects: nothing.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--R18.2`: Checked p.559: with e_z = (−z,1), ē_z − e_z = (2iy,0), so (ē_z − e_z)/(2iy) = (1,0), not (−1,0); the sign of dz changes, and |dz| = 2y is unchanged.

### R18.2/E28: gap

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json), Hypothesis of Theorem 1.6 (§1.2, p. 536) and of Theorem 1.7 (§1.3, p. 539); the step used is in §7.2, p. 591, and §5.3, p. 576 assumes the stronger condition.

**Corrected contract.** In Theorems 1.6 and 1.7 (and §§1.2–1.3), take U = Ô_𝔹^× for a maximal order Ô_𝔹 of 𝔹_f containing Ô_E. This follows from 'U maximal ⊇ Ô_E^×' unless some place v | 2 of F with residue field F_2 splits in E. Theorem 1.1 is unaffected, since such a U can always be chosen.

**Reason and impact.** At a split place v with residue field F_2, O_{E_v}^× = O_v^× × O_v^× spans only {(a, b) : a ≡ b mod ϖ_v}. Counterexample to the p. 591 inference: F = Q and E = Q(√−7), so 2 splits; embed E_2 = Q_2 × Q_2 diagonally in M_2(Q_2) and let L = {(x, y) ∈ Z_2² : x ≡ y mod 2}. U_2 = GL(L) is maximal compact and contains every diag(a, b) with a, b ∈ Z_2^×, but End(L) ∌ diag(1, 0), which sends (1, 1) to (1, 0) ∉ L. Part I needs O_E ⊂ O_B (p. 576; the O_E-action on the CM abelian variety; Erratum §1's Λ1 = O_E ⊂ Λ0 = O_B), and Part II needs it on p. 591, so neither theorem is proved for such U. There P_U corresponds, via X_U ≅ X_{g^{-1}Ug}, to a CM point whose order at v is O_v + ϖ_v O_{E_v}. The right side of Theorem 1.7 does not see this conductor, while CM heights do change with it (g = 1: at a split prime the conductor-2 CM elliptic curve's Faltings height differs by ½ log 2, Nakkajima–Taguchi), so the literal statement is not expected to hold. Checked on the page images of pp. 536, 576 and 591; unchanged in arXiv v3 and not addressed by the erratum. Searched: Erratum5.pdf (18 December 2022), arXiv v3. (Coordinator: recorded as a gap, not an error. The inference on p. 591 is false, so Theorems 1.6 and 1.7 are unproved for such U; that they fail there is expected from the conductor comparison but is not proved here.) Affects: a stated result.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--R18.2`: Checked pp.536, 539, 576 and 591. The p.591 inference “O_{E_v}^× ⊂ U_v induces O_{E_v} ⊂ O_{B_v}” fails at a split v | 2 with residue field F_2: the units of Z_2 × Z_2 span only {(x,y) : x ≡ y mod 2}, and the lattice L = {(x,y) : x ≡ y mod 2} gives a maximal compact GL(L) containing them, with diag(1,0) ∉ End(L). Recorded correctly as a gap affecting the stated Theorems 1.6–1.7 for such U.

### R18.2/E29: gap

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json), §1.2, Theorem 1.6, p. 537, against the standing assumption of §4.1, p. 561.

**Corrected contract.** Add to Theorem 1.6 the hypothesis of Theorem 1.7 that at least two places of F ramify in 𝔹 (X_U compact), or supply the cusp analysis. Theorem 1.1 is unaffected: 𝔹 can be chosen with |Σ(𝔹)| ≥ 3 (for g = 1, add two finite places inert in E).

**Reason and impact.** Theorem 1.6 allows F = Q with Σ(𝔹) = {∞}, where X_U is a modular curve. Part I (integral models, the Hodge bundle L̄_U with ||dz|| = 2 Im z, the height of P_U, §§4–5) is written only for compact X_U, and the non-compact case is asserted ('the results hold in general with taking care of cusps') without proof. Checked on the page images; unchanged in arXiv v3. Affects: a stated result.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--R18.2`: Checked p.537 (Theorem 1.6 has no compactness hypothesis) against p.561 (“we always assume that X_U is compact; but the results hold in general with taking care of cusps”). The cusp case is asserted without proof; gap, correctly scoped.

### R18.2/E30: gap

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json), §4.3, before Theorem 4.10, p. 569.

**Corrected contract.** Take M_℘, W_℘ and W^t_℘ to be the τ-parts for O_℘ ⊗_{Z_p} O_X → O_X, or the O_℘-relative Dieudonné crystal of the strict special formal O_{B,℘}-module ℋ_℘ with its Hodge filtration. These have ranks 4, 2 and 2, as §5.2 implicitly uses. If F_℘/Q_p is ramified, the τ-quotient of Lie(ℋ^t_℘)^∨ has torsion, and one must use its image in M_℘ or the relative theory.

**Reason and impact.** ℋ_℘ has height 4d and dimension 2 (Theorem 4.9(1): Lie is locally free of rank 1 over O_X ⊗_{O_℘} O_{K_0}), where d = [F_℘:Q_p]. So the absolute crystal M_℘ has rank 4d, W_℘ has rank 2 and W^t_℘ has rank 4d − 2. For d > 1, 'taking determinants' of W^t → W^∨ ⊗ ω gives no map det W^t → det W^∨ ⊗ ω^{⊗2}, and the proof of Theorem 4.10 in fact computes only with the rank-2 pieces (the idempotents e_i, and the eigenlines L_i, N_i). Theorem 4.10 as intended is unaffected. Affects: the proof.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--R18.2`: Checked p.569: M_℘ is the absolute covariant Dieudonné crystal of ℋ_℘, of rank 4[F_℘:Q_p], with W_℘ of rank 2 and W^t_℘ of rank 4[F_℘:Q_p]−2, so “taking determinants” does not give a map of line bundles when F_℘ ≠ Q_p. The relative (τ-part) crystal is what the proof uses.

### R18.2/E31: error

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json), §5.2, before Proposition 5.4, p. 575.

**Corrected contract.** True when F_℘/Q_p is unramified. Then O_{F,p} ⊗_{Z_p} O_L is a product, the τ-quotients are exact direct summands, and Proposition 5.4 follows from Proposition 5.3 by taking τ-components. When e(F_℘/Q_p) > 1, W(I_y) is a nonzero torsion module, the τ-quotient sequences 0 → W(G^t) → M(G) → W(G)^∨ → 0 displayed on p. 575 need not be left exact, and Proposition 5.4 and Corollary 5.5 need a separate integral argument. For example, W(−) could be redefined as the image in the generic fibre and the identities re-proved at the level of determinants. The paper gives no such argument.

**Reason and impact.** Let τ′ ≠ τ be an embedding of F_℘ with the same residue embedding; one exists iff e(F_℘/Q_p) > 1. Ψ contains an embedding of E above τ′, so Ω(I_y) has a nonzero part on which O_℘ acts through τ′. Its τ-quotient is nonzero by Nakayama over the local ring O_℘ ⊗_{W(k_℘),ι_0} O_L. Explicitly, for F_℘ = Q_p(√p) with ℘ split in E, Ω(I_w) ≅ O_L with √p acting as −√p, so W(I_y) ⊇ O_L/(2√p) ≠ 0. W is defined on p. 575 as the τ-quotient for 'τ : O_{F,p} ⊗_{Z_p} O_K → O_K'. Theorem 1.1 (the averaged Colmez formula itself) is proved independently in [AGHMP18]. Affects: the proof.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--R18.2`: Checked p.575. For F_℘ = Q_p(√p), an embedding τ′ ≠ τ with the same residue embedding exists and Ψ contains an embedding above it, so the τ-quotient of Ω(I_y) is O_L/(τ(√p) − τ′(√p)) = O_L/(2√p) ≠ 0. W(I_y) = 0 and the exactness of the τ-quotient sequences therefore hold only when F_℘/Q_p is unramified.

### R18.2/E32: error

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json), §5.2, deformation display and Corollary 5.5, pp. 575–576.

**Corrected contract.** Identity (3) is false. Consequently 𝒳̂″_{1,x″} is not the universal deformation of ℋ″_{x″} as a p-divisible O_{E,p}-module; it can be at most the universal deformation with extra structure, such as the polarization from X′, and the claim is not used later. Corollary 5.5 follows directly without this chain. By Proposition 5.4 the W(I^t_y)-twists cancel in det W(ℋ″) ⊗ det W(ℋ″^t), which gives det W(ℋ_x) ⊗ det W(ℋ^t_x) ⊗ O_{K′} = N_{1,℘,x} ⊗ O_{K′} (E8 convention). The lattices lie in the generic fibre of N″ ≅ ω^{⊗2}, not ω^{-2}. In the first line, H should be H″ throughout.

**Reason and impact.** At τ, W(H^t_x) and W(H_x)^∨ each have O_K-rank 2 and are free of rank 1 over O_{E,K}. They carry the standard 2-dimensional representation of O_{𝔹,℘} ⊗ K ≅ M_2(K), in which E acts with types τ1 and τ2 once each. So Hom over O_{E,K} has O_K-rank 2 and Hom over O_{𝔹,℘} has rank 1; the first two lines of the chain also have rank 2. In complex terms, deformations of (A, O_E) of Lie type Φ1+Φ2 move the τ1- and τ2-lines independently (P^1 × P^1), and only the polarization cuts this down to the curve X′. Affects: the proof.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--R18.2`: Checked pp.575–576. At τ, W(H^t_x) and W(H_x)^∨ are the standard two-dimensional representation of O_{B,℘} ⊗ K ≅ M_2(K), on which E acts through two distinct characters, so Hom over O_{E,K} has rank 2 and Hom over O_{B,℘} has rank 1: identity (3) is false. Corollary 5.5 still follows from Proposition 5.4 by determinant cancellation (in the unramified case).

### R18.2/E33: misprint

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json), §4.3, proof of Theorem 4.9, p. 569.

**Corrected contract.** Proposition 3.5, together with Proposition 3.2 and the description of H′ on pp. 555–556.

**Reason and impact.** §3 has no Theorem 3.5. The level structures come from Proposition 3.5, the special O_{B,℘} and étale conditions from the moduli problem of Proposition 3.2 and p. 555. Affects: nothing.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--R18.2`: Checked p.569: “follow from Theorem 3.5”; §3 has Proposition 3.5 (level structures) and Proposition 3.2 (the moduli problem).

### R18.2/E34: misprint

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json), §5.2, proof of Proposition 5.2 and the 'Deformation theory' paragraph, p. 574.

**Corrected contract.** the tensor product T(H_x) ⊗_{O_{E,p}} T(I_y) … by Theorem 4.9 … D(ℋ″_{x″}), D(ℋ_x), D(ℐ_y) over O_L.

**Reason and impact.** Proposition 5.1 is a tensor identity, and y is the only point of Y in play. There is no Proposition 4.9. The three groups are defined over O_L for the L-point (x,y). Affects: nothing.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--R18.2`: Checked p.574: “the product T(H_x) × T(I_z)”, “by Proposition 4.9”, and the Dieudonné modules over O_K and O_{K′}. Proposition 5.1 is a tensor identity, the result is Theorem 4.9, and all three modules live over O_L.

### R18.2/E35: gap

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json), §5.2, before and in the proof of Proposition 5.2, p. 574.

**Corrected contract.** For p = 2 cite Kim [Kim12], Lau [Lau14] and Liu [Liu13], as the paper itself does in the proof of Proposition 5.3. Also justify 'weights 0 and −1': at embeddings above τ, I has weight 0; above τ′ ≠ τ, ℋ_℘ has weight 0 because it is strict; and ℋ^℘ is étale.

**Reason and impact.** [Kis06] proves that crystalline representations with weights in {0,1} are Barsotti–Tate only for p > 2. The dyadic case is due to Kim, Lau and Liu. Without the component check, a tensor product of two representations with weights in {0,−1} could have weight −2. Affects: the proof.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--R18.2`: Checked p.574: Proposition 5.2 cites only Breuil–Kisin [Kis06], which is for p > 2, while the proof of Proposition 5.3 itself cites Kim, Lau and Liu for p = 2. The weight claim needs the componentwise check stated in the correction.

### R18.2/E36: misprint

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json), §5.2, 'Integral models', p. 573.

**Corrected contract.** X″_{1,℘′} = X″_1 ⊗_{F′} K′

**Reason and impact.** Confirmed on the page image. The isomorphism f_℘′ right after it has target X″_{1,℘′}, the base change of X″_1. Affects: nothing.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--R18.2`: Checked on the page image of p.573: “X″_{1,℘′} = X′_1 ⊗_{F′} K′”; the isomorphism that follows has target X″_{1,℘′}.

### R18.2/E37: misprint

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json), §4.2, proof of Corollary 4.6(2), p. 566.

**Corrected contract.** This proves the case H = F.

**Reason and impact.** Confirmed on the page image. The paragraph opens 'we first treat the case H = F'; K is not in play here. Affects: nothing.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--R18.2`: Checked p.566: “This proves the case H = K”, in a paragraph that treats H = F.

### R18.2/E38: misprint

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json), §4.3, proof of Theorem 4.10, pp. 569–570.

**Corrected contract.** Ω(ℋ_℘) … Now assume that ℘ is nonsplit in 𝔹 (i.e. ℘ | d_B).

**Reason and impact.** Confirmed on the page images. The case distinction is whether ℘ is split in 𝔹, and the next sentence uses the division algebra B_℘ ⊃ O_K + O_Kj. Affects: nothing.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--R18.2`: Checked pp.569–570: “Ω(ℋ_0)” and “Now assume that ℘ is nonsplit in F”; the case distinction is whether ℘ splits in B.

### R18.2/E39: misprint

[Recorded evidence](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json), §4.1, Proposition 4.3 and the preceding paragraph, p. 563.

**Corrected contract.** Δ̄_0/O^1_{B,p} ≅ Δ̄′_0/O^1_{B,p}, identified through G → G″ (the proof of Theorem 4.5 writes Δ_0 = Δ′_0).

**Reason and impact.** Confirmed on the page image. X′^0_1 carries the action of Δ̄′_0/O^1_{B,p}, as the paragraph itself says, so the second group must be the primed one. Affects: nothing.

**Correction status.** new

**Independent review.** confirmed by `REV-HilbertModularVarietiesAndShimuraCurves--R18.2`: Checked on the page image of p.563: “Δ̄_0/O^1_{B,p} ⊂ Δ̄_0/O^1_{B,p}” is printed twice with both groups unprimed; the second must be Δ̄′_0, and the two are identified through G → G″.

## Source ownership routing

The quaternionic continuation uses these source items under their owning node
or supplier contract. Height and CM-point routes name the owner; they do not
claim that an unlisted height or graph-kernel theorem is proved here.

- **`PAPER-YUAN-ZHANG-18/quaternion-datum` → `HilbertModularVarietiesAndShimuraCurves:R18.1`:** Canonical incoherent/nearby quaternion datum; order-containment and compactness corrections imported.
- **`PAPER-YUAN-ZHANG-18/pel-groups` → `HilbertModularVarietiesAndShimuraCurves:R18.1`:** Canonical group/reflex and torus bridge; owned integral instance is quaternion-pel-instance.
- **`PAPER-YUAN-ZHANG-18/reflex-contains-F` → `HilbertModularVarietiesAndShimuraCurves:R18.1`:** Canonical reflex-field theorem, not re-planned.
- **`PAPER-YUAN-ZHANG-18/pel-moduli` → [R18.2/quaternion-pel-instance](#r18.2-quaternion-pel-instance):** Generic moduli/representability imported from M1–M2, actual quaternionic integral datum checked.
- **`PAPER-YUAN-ZHANG-18/pel-integral` → [R18.2/carayol-split-model](#r18.2-carayol-split-model):** Split finite-place integral PEL specialization; division place uses uniformisation.
- **`PAPER-YUAN-ZHANG-18/level-integral` → [R18.2/integral-pdiv](#r18.2-integral-pdiv):** Discriminant-qualified level interpretation, with generic normalization M4.
- **`PAPER-YUAN-ZHANG-18/pel-pdiv` → [R18.2/integral-pdiv](#r18.2-integral-pdiv):** Auxiliary PEL p-divisible carrier imported, quaternionic extension specialized.
- **`PAPER-YUAN-ZHANG-18/complex-ks` → [R18.2/arithmetic-hodge-line](#r18.2-arithmetic-hodge-line):** Metric 2 Im z and sign-corrected generic Kodaira–Spencer instance; generic bundles imported.
- **`PAPER-YUAN-ZHANG-18/point-good-reduction` → `PELModuli:M2`:** Generic PEL compact/proper and good reduction theorem; actual local specialization in carayol-split-model.
- **`PAPER-YUAN-ZHANG-18/genus-small-level` → [R18.2/effective-small-level](#r18.2-effective-small-level):** Principal level ≥3 effective freeness and genus.
- **`PAPER-YUAN-ZHANG-18/quaternion-pdiv` → [R18.2/quaternion-pdiv-tower](#r18.2-quaternion-pdiv-tower):** Right fibre action and torsion-dependent finite tame descent.
- **`PAPER-YUAN-ZHANG-18/component-comparison` → [R18.2/connected-pel-comparison](#r18.2-connected-pel-comparison):** Connected effective groups and coefficient maps.
- **`PAPER-YUAN-ZHANG-18/quaternion-regular-model` → [R18.2/regular-model-tower](#r18.2-regular-model-tower):** Split Carayol and division BZ models with distinct local scopes.
- **`PAPER-YUAN-ZHANG-18/coarse-model` → [R18.2/coarse-model](#r18.2-coarse-model):** Fine normal quotient; regularity not inherited automatically.
- **`PAPER-YUAN-ZHANG-18/qfactorial` → [R18.2/qfactorial-model](#r18.2-qfactorial-model):** Exact unramified base-change hypothesis.
- **`PAPER-YUAN-ZHANG-18/hodge-qline` → [R18.2/arithmetic-hodge-line](#r18.2-arithmetic-hodge-line):** Coarse ramification correction, norms and metric.
- **`PAPER-YUAN-ZHANG-18/integral-pdiv` → [R18.2/integral-pdiv](#r18.2-integral-pdiv):** Relative height and special formal module.
- **`PAPER-YUAN-ZHANG-18/integral-ks` → [R18.2/integral-kodaira-spencer](#r18.2-integral-kodaira-spencer):** Correct determinant sign/factor; ramified relative filtration gap.
- **`PAPER-YUAN-ZHANG-18/bridge-torus` → `HilbertModularVarietiesAndShimuraCurves:R18.1`:** Torus/group/canonical X″ owned there; integral coefficient specialization in bridge-tate-comparison.
- **`PAPER-YUAN-ZHANG-18/tate-tensor` → [R18.2/bridge-tate-comparison](#r18.2-bridge-tate-comparison):** Tensor over O_E,p and diagonal centre cancellation.
- **`PAPER-YUAN-ZHANG-18/point-pdiv-extension` → [R18.2/bridge-point-extension](#r18.2-bridge-point-extension):** Pointwise only, all-prime classification and no weight −2.
- **`PAPER-YUAN-ZHANG-18/cotangent-tensor` → [R18.2/bridge-filtered-crystal](#r18.2-bridge-filtered-crystal):** Integral structured tensor; raw ramified τ quotient nonexact.
- **`PAPER-YUAN-ZHANG-18/cm-alignment` → `HilbertModularVarietiesAndShimuraCurves:R18.1`:** CM-point alignment on canonical torus bridge; height identity owned by R35.
- **`PAPER-YUAN-ZHANG-18/level-projective-system` → [R18.2/regular-model-tower](#r18.2-regular-model-tower):** Fine level regular model tower and compatible transitions.
- **`PAPER-YUAN-ZHANG-18/pdiv-comparison` → [R18.2/connected-pel-comparison](#r18.2-connected-pel-comparison):** Corrected effective group isomorphism and split local sheaf comparison.
- **`PAPER-YUAN-ZHANG-18/finite-level-comparison` → [R18.2/finite-pel-comparison](#r18.2-finite-pel-comparison):** Finite level connected component choices retained.
- **`PAPER-YUAN-ZHANG-18/determinant-cancellation` → [R18.2/bridge-determinant](#r18.2-bridge-determinant):** Unramified cancellation plus explicit ramified repair.
- **`PAPER-YUAN-ZHANG-18/rev-cm-points-of-x-prime` → `HilbertModularVarietiesAndShimuraCurves:R18.1`:** Correct effective CM torus orbits and universal family point scope.
- **`PAPER-YUAN-ZHANG-18/rev-case-2-p-divisible-group` → [R18.2/bridge-point-extension](#r18.2-bridge-point-extension):** Case-2 extension only pointwise; no global universal family claimed.
- **`PAPER-YUAN-ZHANG-18/rev-projective-system-of-quaternionic-models` → [R18.2/regular-model-tower](#r18.2-regular-model-tower):** Actual finite-level compatibility and allowed discriminant levels.
- **`PAPER-YUAN-ZHANG-18/rev-integral-models-of-x-double-prime` → [R18.2/bridge-integral-model](#r18.2-bridge-integral-model):** X″ rather than X′, ramified base change loses regularity.
- **`PAPER-YUAN-ZHANG-18/rev-cerednik-drinfeld-uniformization` → [R18.5/totally-real-uniformisation](#r18.5-totally-real-uniformisation):** Division-prime formal uniformisation; distinguish BZ totally-real theorem from BC rational global case.
- **`PAPER-YUAN-ZHANG-18/rev-cm-points-on-x-u` → `HilbertModularVarietiesAndShimuraCurves:R18.1`:** Canonical CM point and actual order containing O_E. Erratum graph check and arithmetic heights imported.
- **`PAPER-COLMEZ-DOSPINESCU-NIZIOL-23/4-quaternionic-setup` → [R18.3/residual-hecke-ideal](#r18.3-residual-hecke-ideal):** Formal residual kernel and inverse-norm dictionary; actual Galois eigen-system requested from R19.
- **`PAPER-COLMEZ-DOSPINESCU-NIZIOL-23/4-hecke-algebra` → [R18.3/residual-hecke-ideal](#r18.3-residual-hecke-ideal):** Formal residual kernel and inverse-norm dictionary; actual Galois eigen-system requested from R19.
- **`PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B/1.2-half-plane-models` → [R18.5/affinoid-reduction](#r18.5-affinoid-reduction):** Affinoids and blow-up union model, also drinfeld-formal-model.
- **`PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B/5.2-shimura-setup` → [R18.5/tower-uniformisation](#r18.5-tower-uniformisation):** All-level rigid uniformisation with the CDN global setup and transition maps.
- **`PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B/5.2-prop-5-4` → [R18.5/tower-uniformisation](#r18.5-tower-uniformisation):** All-level rigid uniformisation with the CDN global setup and transition maps.
- **`PAPER-KHARE-WINTENBERGER-09-II/209` → [R18.3/neatness-base-change](#r18.3-neatness-base-change):** Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **`PAPER-KHARE-WINTENBERGER-09-II/212` → [R18.3/definite-class-set](#r18.3-definite-class-set):** §7 set-up: the definite algebra D, its maximal order, local splittings and coefficient rings are the data of the class set.
- **`PAPER-KHARE-WINTENBERGER-09-II/213` → [R18.3/tw-level](#r18.3-tw-level):** U₀(v) is the Iwahori factor U′_v of the Taylor–Wiles level and the U₀(w) of definite-degeneracy; U₁(v) is the analogous congruence factor used at p by R22.1 and R19.5.
- **`PAPER-KHARE-WINTENBERGER-09-II/214` → [R18.3/dyadic-sign-extension](#r18.3-dyadic-sign-extension):** Admissible levels with Σ₀, U_v=D_v^× and the maximal compact U⁰ (p=2): the noncompact convention and its index-two quotient.
- **`PAPER-KHARE-WINTENBERGER-09-II/215` → [R18.3/definite-specialisation](#r18.3-definite-specialisation):** The space S_{τ,ψ}(U,A) as the fixed-central-character AF.5 specialization.
- **`PAPER-KHARE-WINTENBERGER-09-II/216` → [R18.3/quaternion-weight](#r18.3-quaternion-weight):** The weight modules W_k, W̄_k and the spaces S_{k,ψ}(U,O), S_{k,ψ}(U,F).
- **`PAPER-KHARE-WINTENBERGER-09-II/217` → [R18.3/dyadic-sign-extension](#r18.3-dyadic-sign-extension):** The 2^{|Σ₀|} extensions of W₂ and the unique extension of W̄₂ to U(A_F^∞)^×.
- **`PAPER-KHARE-WINTENBERGER-09-II/218` → [R18.3/definite-specialisation](#r18.3-definite-specialisation):** Display (5): forms as invariants on the finite double-coset set.
- **`PAPER-KHARE-WINTENBERGER-09-II/219` → [R18.3/split-hecke-normalisation](#r18.3-split-hecke-normalisation):** The set S, the operators T_v and S_v=ψ(π_v), and the Hecke algebra T_ψ(U).
- **`PAPER-KHARE-WINTENBERGER-09-II/221` → [R18.3/definite-jl](#r18.3-definite-jl):** R18.3 owns the Jacquet–Langlands realization of S_{k,ψ}(U,O)_m; the Galois representation ρ_f and its Frobenius characterisation are R19 (AutomorphicGaloisRepresentations) work.
- **`PAPER-KHARE-WINTENBERGER-09-II/222` → [R18.3/definite-degeneracy](#r18.3-definite-degeneracy):** Lemma 7.1 (definite Ihara lemma).
- **`PAPER-KHARE-WINTENBERGER-09-II/224` → [R18.3/isotropy-exponent](#r18.3-isotropy-exponent):** Display (6).
- **`PAPER-KHARE-WINTENBERGER-09-II/225` → [R18.3/isotropy-exponent](#r18.3-isotropy-exponent):** Display (7).
- **`PAPER-KHARE-WINTENBERGER-09-II/226` → [R18.3/isotropy-exponent](#r18.3-isotropy-exponent):** Finiteness and the Sylow exponent bound 2N_w for compact U.
- **`PAPER-KHARE-WINTENBERGER-09-II/228` → [R18.3/isotropy-exponent](#r18.3-isotropy-exponent):** The Sylow exponent bound 4N_w for noncompact U (p=2).
- **`PAPER-KHARE-WINTENBERGER-09-II/229` → [R18.3/isotropy-exponent](#r18.3-isotropy-exponent):** Lemma 7.3(1) is the §7.2 exponent bound applied over F′.
- **`PAPER-KHARE-WINTENBERGER-09-II/230` → [R18.3/base-change-annihilator](#r18.3-base-change-annihilator):** Lemma 7.3(2).
- **`PAPER-KHARE-WINTENBERGER-09-II/233` → [R18.3/tw-stabilisers](#r18.3-tw-stabilisers):** The twisted modules W_k(χ) and S_{W_k(χ),ψ}(U′_Q,O) whose ranks Lemma 7.4(1) compares.
- **`PAPER-KHARE-WINTENBERGER-09-II/234` → [R18.3/tw-stabilisers](#r18.3-tw-stabilisers):** First claim in the proof of Lemma 7.4.
- **`PAPER-KHARE-WINTENBERGER-09-II/235` → [R18.3/tw-stabilisers](#r18.3-tw-stabilisers):** Display (8).
- **`PAPER-KHARE-WINTENBERGER-09-II/236` → [R18.3/tw-stabilisers](#r18.3-tw-stabilisers):** Lemma 7.4(1).
- **`PAPER-KHARE-WINTENBERGER-09-II/237` → [R18.3/tw-freeness](#r18.3-tw-freeness):** Lemma 7.4(2).
- **`PAPER-KHARE-WINTENBERGER-09-II/242` → [R18.3/dyadic-norm-twist](#r18.3-dyadic-norm-twist):** The twist f_χ(g)=f(g)χ(Nm g) of §7.5.
- **`PAPER-KHARE-WINTENBERGER-09-II/243` → [R18.3/dyadic-hecke-twist](#r18.3-dyadic-hecke-twist):** Proposition 7.6(1).
- **`PAPER-KHARE-WINTENBERGER-09-II/244` → [R18.3/dyadic-hecke-twist](#r18.3-dyadic-hecke-twist):** Proposition 7.6(2).
- **`PAPER-KHARE-WINTENBERGER-09-II/272` → [R18.3/neatness-base-change](#r18.3-neatness-base-change):** Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **`PAPER-KHARE-WINTENBERGER-09-II/276` → [R18.3/definite-specialisation](#r18.3-definite-specialisation):** R18.3 supplies S_{k,ψ}(U,O) and T_ψ(U) for the §9.1.1 data; the choice of (Σ,S,D,U,m) is GL2ModularityLifting:R22.1/minimal-level-data.

## Suggested signatures and completion criteria

The suggested file has one import block and one standard note. Hilbert prototypes
retain namespace `TauCeti.HilbertModular`; quaternionic prototypes retain
`TauCeti.Blueprint.Quaternionic`. These namespace-qualified names coexist without
renaming the reviewed interfaces. The Mathlib-only core includes fractional-ideal
and trace signatures, congruence units, residue matrices, quotients, double cosets,
weight modules, elementary projective point sets, norm twists and polynomial
kernels. Every proof placeholder remains `sorry`.

The arithmetic positive-unit specialization uses the existing Tau Ceti subgroup;
the Mathlib-only prototype keeps its subgroup P explicit because the compiled
Tau Ceti module is unavailable in the shared build. Relative abelian schemes,
ordered sheaves, strict quaternionic p-divisible moduli, formal Drinfeld schemes,
universal PEL families and integral étale cohomology still need supplier carriers.
The file's contract ledgers list the exact node, API and test names and statements
for these omissions. A ledger entry is not an elaborated signature.

Completion requires closing the supplier and source-proof obligations, replacing
omitted signatures by their actual carrier-based Lean forms, and rerunning the
node-level dependency and acceptance checks. The layer restructuring proposals
and producer worklist are collected in the
[assembly handoff](../handoff/ASM-HilbertModularVarietiesAndShimuraCurves.md).
